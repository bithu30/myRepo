import bottle

@bottle.route('/')
def home_page():
    mythings = ['apple','orange','grapes']
    return bottle.template('hello_world',username='Bijith',things = mythings,title="Hello World")
    #return "Hello World\n"

@bottle.route('/favorite_fruit', method='POST')
def favorite_fruit():
    fruit=bottle.request.forms.get("fruit")
    if ( fruit =="" or fruit==None):
        fruit="No fruit Selected"
    return bottle.template('favorite.tpl', {'fruit': fruit,'title':'Fruit Selection Conformation' } )

@bottle.route('/testpage')
def test_page():
    mythings = ['test1', 'test2', 'test3']
    return bottle.template('hello_world', { 'username':'Bijith', 'things':mythings, 'title':"Hello World"})
    #return "This is a Test\n"

@bottle.route('/goaway')
def go():
    return "Just go Away\n"

bottle.debug(True)
bottle.run(host='localhost',port=9000 )