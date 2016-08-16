#!/usr/bin/env python
#
# Copyright 2007 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
import webapp2
import jinja2
import os
import logging




#Route to the template folder in site root folder
JINJA_ENVIRONMENT = jinja2.Environment(
	loader = jinja2.FileSystemLoader(os.path.dirname(__file__)+"/templates" )
)
#Routing classes for all the pages
class MainHandler(webapp2.RequestHandler):
    def get(self):
		try:
			title = "--Welcome to ABC Inc.--"
			template_vars = {
			'title':title,
			'users':['user1','user2']
			}
			template = JINJA_ENVIRONMENT.get_template('index.html')
			self.response.out.write( template.render(template_vars))
		except Exception,e:
			logging.info('MainHandler Error')
			self.response.out.write("<div >An error occured - {0}".format(e) +"</div>")
class ProductPage(webapp2.RequestHandler):
    def get(self):
        #self.response.write('Hello world!')
		title = "Product Listing"
		template_vars = {
		'title':title
		}
		template = JINJA_ENVIRONMENT.get_template('products.html')
		self.response.out.write( template.render(template_vars))
		
class ContactPage(webapp2.RequestHandler):
    def get(self):
        #self.response.write('Hello world!')
		title = "About Us"
		template_vars = {
		'title':title
		}
		template = JINJA_ENVIRONMENT.get_template('about.html')
		self.response.out.write( template.render(template_vars))		

app = webapp2.WSGIApplication([
    ('/', MainHandler),
	('/index.html',MainHandler),
	('/products.html',ProductPage),
	('/about.html',ContactPage),
], debug=True)
