class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /courses
  # GET /courses.json
  def index
    # Search parameter, if empty show all
    @searchparam = params[:search]

    # Call to delete old courses and mail owner
    # checkdue

    # New - Dynamic Grid for all the courses
    @courses_grid = initialize_grid(Course.where("titel ILIKE ?", "%#{@searchparam}%"))
  end

  def mycourses
    # Show only owners courses
    @courses = Course.where(owner: current_user)
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  def checkdue
    # First get the courses
    @duecourses = Course.all
    @duecourses.each do |dc|
      # Check for each course if past and no email sent yet
      if dc.start.past? && !dc.duesend
        PayMailer.due_email(dc.owner, dc.id).deliver
        dc.update_attribute :duesend, true
      end
    end
  end

  # POST /courses
  # POST /courses.json
  def create
    # Create course with user set
    @course = Course.new(course_params)
    @course.owner = current_user.id
    @course.duesend = false
    @user = current_user

    # Only increment profilestatus when not done yet
    if Course.where(owner:  current_user).blank?
      @user.increment!(:profilstatus)
    end

    # Does he have enough credits to create a course?
    if @user.ccounter >= 1
      respond_to do |format|
        if @course.save
          # Created, so edit counter
          @user.update_attribute(:ccounter, @user.ccounter-1)
          format.html { redirect_to @course, notice: 'Kurs wurde erfolgreich erstellt.' }
          format.json { render :show, status: :created, location: @course }
        else
          format.html { render :new }
          format.json { render json: @course.errors, status: :unprocessable_entity }
        end
      end
    else  
      # If not, inform him and abort creation
      redirect_to dashboard_path, alert: 'Keine bezahlten Kurse mehr übrig.'
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Kurs erfolgreich aktualisiert.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    # Straight forward, delete course
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Kurs erfolgreich gelöscht.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:titel, :kurstyp, :start, :anbieter, :ort, :preis, :inhalt, :zielpublikum, :zulassung, :abschluss, :info, :leitung, :kontakt, :image, :owner, :duesend)
    end
end