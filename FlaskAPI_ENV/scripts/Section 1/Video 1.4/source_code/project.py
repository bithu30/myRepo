import uuid

class Project:
	__name = None
	__start_date = None
	__end_date = None
	__id = None
	__description = None
	
	def __init__(self, name, start_date, end_date, description):
		self.__id = uuid.uuid4()
		self.name = name
		self.start_date = start_date
		self.end_date = end_date
		self.description = description
		
	#
	# PROPERTIES
	#
	
	@property
	def id(self):
		return self.__id
		
	@property
	def name(self):
		return self.__name
		
	@name.setter
	def name(self, value):
		self.__name = value
		
	@property
	def start_date(self):
		return self.__start_date
		
	@start_date.setter
	def start_date(self, value):
		self.__start_date = value
		
	@property
	def end_date(self):
		return self.__end_date
		
	@end_date.setter
	def end_date(self, value):
		self.__end_date = value
	
	@property
	def description(self):
		return self.__description
		
	@description.setter
	def description(self, value):
		self.__description = value	
	
	#
	# METHODS
	#
	
	def serialize(self):
		return {
			"name": self.name,
			"description": self.description,
			"id": self.id,
			"start_date": self.start_date,
			"end_date": self.end_date
		}
	