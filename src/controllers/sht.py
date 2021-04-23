from src.models.sht import ShortenModel, UsersModel, Authentication

shortenModel = ShortenModel()
usersModel = UsersModel()
authentication = Authentication()

class ShortenController():
    
    def generate_short_link(self, url_to_shorten, url_shortened, user_id):
        shortenModel.generate_short_link(url_to_shorten, url_shortened, user_id)
    
    def redirect_url(self, url_shortened):
        return shortenModel.redirect_url(url_shortened)
    
    def listUrls(self):
        return shortenModel.listUrls()
    
    def listUrlsUser(self, id):
        return shortenModel.listUrlsUser(id)
    
    def deleteUrl(self, url_shorten):
        shortenModel.deleteUrl(url_shorten)

class UsersController():

    def create_user(self, user, email, password):
        usersModel.create_user(user, email, password)

class Authentication():

    def auth_user(self, email):
        return authentication.auth_user(email)

