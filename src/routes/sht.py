from src import app
from werkzeug.urls import url_parse
from flask_wtf import FlaskForm
from src.controllers.sht import ShortenController, UsersController, Authentication
from flask import make_response, session, jsonify, request, render_template, redirect, flash, url_for
import random, string, hashlib

shortenController = ShortenController()
usersController = UsersController()
authentication = Authentication()


@app.route('/urls', methods=['GET', 'POST'])
def listUrls():
    
    if 'user' in session:
        id = session['id']
        urls = shortenController.listUrlsUser(id)
        #list_urls.append(urls)
        return render_template('sht/list.html', urls=urls)
        return session['user']
    else:
        urls = shortenController.listUrls()
        return render_template('sht/list.html', urls=urls)

@app.route('/', methods=['POST'])
def createURL():

    url_to_shorten = request.form['url']

    if not url_to_shorten:
        flash('The URL is required!')
        return redirect(url_for('index.html'))

    letters = string.ascii_letters + string.digits
    f = 5
    url_show = 'localhost:3000/sh/'
    url_content = ''
    for i in range(f):
        ramStr = random.choice(letters)
        url_content = url_content + ramStr
        url_show = url_show + ramStr

    url_shortened = url_content
    if 'user' in session:
        id = session['id']
        user_id = int(id)
        shortenController.generate_short_link(url_to_shorten, url_shortened, user_id)
    else:
        user_id = None
        shortenController.generate_short_link(url_to_shorten, url_shortened, user_id)
    
    return render_template('sht/index.html', url_shortened=url_shortened, url_to_shorten=url_to_shorten, url_show=url_show)


@app.route('/sh/<url_shortened>', methods=['GET'])
def redirectURL(url_shortened):
    data = shortenController.redirect_url(url_shortened)
    return redirect(data)

@app.route('/users', methods=['POST', 'GET'])
def createUser():
    user = request.form['user']
    email = request.form['email']
    passwordno = request.form['password']
    password = hashlib.md5(passwordno.encode())

    usersController.create_user(user, email, password.hexdigest())
    return render_template('users/create.html')
 
@app.route('/login', methods=['POST', 'GET'])
def loginUser():
    email = request.form['email']
    passwordno = request.form['password']
    passwordsn = hashlib.md5(passwordno.encode())
    password = passwordsn.hexdigest()

    try:
        userAuth = authentication.auth_user(email)
        
        if userAuth and password == userAuth[1]:
            session['id'] = userAuth[3]
            session['user'] = userAuth[2]
            session['email'] = userAuth[0]
            success_message = 'Welcome {}'.format(userAuth[2])
            flash(success_message)
            return render_template('index.html',login=userAuth)
        else:
            error_message = 'User or password invalid!'
            flash(error_message)
            return render_template('users/login.html')
    except Exception as e:
        return "Error user not found"
    

@app.route('/logout', methods=["GET", "POST"])
def logout():
    session.clear()
    #session.pop('user', None)
    return render_template('index.html')

@app.route('/urls/<url_shortened>', methods=['POST', 'GET'])
def updateURL(url_shortened):
    data = shortenController.redirect_url(url_shortened)
    return redirect(data)

@app.route('/delete/<url_shorten>', methods=['POST', 'GET'])
def deleteURL(url_shorten):
    if 'user' in session:
        shortenController.deleteUrl(url_shorten)
        return redirect(url_for('listUrls'))
    else:
        flash('Unauthorized')
        #return render_template('sht/list.html')
        return redirect(url_for('listUrls'))



