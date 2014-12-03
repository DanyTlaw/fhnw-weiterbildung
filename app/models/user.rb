class User < ActiveRecord::Base
 before_create :addCourses

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

private

	def addCourses
		self.ccounter = 1         	
	end         

end
