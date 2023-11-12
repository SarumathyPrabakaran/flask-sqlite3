class Details:
    def __init__(self,name,city):
        self.name = name
        self.city = city
    def __repr__(self) :
        return "Details(%s, %s)" % (self.name, self.city)