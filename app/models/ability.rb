class Ability
  include CanCan::Ability

  # Define abilities for the passed in user here.
  def initialize(user)

   # guest user (not logged in) 
   user ||= User.new 

   # Alias to give proper abilities to the owner of his own course and profile
   alias_action :create, :update, :destroy, :mycourses, :myprofil, :to => :cud

   # Everyone can read all courses but only the owner can alter it
   can :read, Course
   can :cud, Course, :owner => user.id

   # Everyone can read all profiles but only the owner can alter it
   can :read, Profil
   can :cud, Profil, :user_id => user.id

  end
end
