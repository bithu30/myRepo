class Room:

    def __init__(self, room_name):
        self.name = room_name
        self.desc = None

    def set_desc(self,rdesc):
        self.desc = rdesc

    def get_desc(self):
        return self.desc

    def set_rname(self, room_name):
        self.name = room_name

    def get_rname(self):
        return self.name