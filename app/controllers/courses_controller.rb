class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /courses
  # GET /courses.json
  def index
    # Search parameter, if empty show all
    @searchparam = params[:search]

    # New - Dynamic Grid
    @courses_grid = initialize_grid(Course.where("titel ILIKE ?", "%#{@searchparam}%"))
  end

  def mycourses
    # Show only his courses
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

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    @course.owner = current_user.id
    @user = current_user

    #erhöht den profilstatus nur beim ersten mal Kurs erstellen
    if Course.where(owner:  current_user).blank?
      @user.increment!(:profilstatus)
    end

    if @user.ccounter >= 1
      @course = Course.new(course_params)
      @course.owner = current_user.id
      respond_to do |format|
        if @course.save
          format.html { redirect_to @course, notice: 'Course was successfully created.' }
          format.json { render :show, status: :created, location: @course }
        else
          format.html { render :new }
          format.json { render json: @course.errors, status: :unprocessable_entity }
        end
      end
    else  
      format.html { redirect_to dashboard_path, notice: 'Keine bezahlten Kurse mehr übrig.' }
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
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
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
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
      params.require(:course).permit(:titel, :kurstyp, :start, :anbieter, :ort, :preis, :inhalt, :zielpublikum, :zulassung, :abschluss, :info, :leitung, :kontakt, :image, :owner)
    end
end