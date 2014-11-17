require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
  setup do
    @course = courses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:courses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course" do
    assert_difference('Course.count') do
      post :create, course: { abschluss: @course.abschluss, anbieter: @course.anbieter, image: @course.image, info: @course.info, inhalt: @course.inhalt, kontakt: @course.kontakt, kurstyp: @course.kurstyp, leitung: @course.leitung, ort: @course.ort, preis: @course.preis, start: @course.start, titel: @course.titel, zielpublikum: @course.zielpublikum, zulassung: @course.zulassung }
    end

    assert_redirected_to course_path(assigns(:course))
  end

  test "should show course" do
    get :show, id: @course
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @course
    assert_response :success
  end

  test "should update course" do
    patch :update, id: @course, course: { abschluss: @course.abschluss, anbieter: @course.anbieter, image: @course.image, info: @course.info, inhalt: @course.inhalt, kontakt: @course.kontakt, kurstyp: @course.kurstyp, leitung: @course.leitung, ort: @course.ort, preis: @course.preis, start: @course.start, titel: @course.titel, zielpublikum: @course.zielpublikum, zulassung: @course.zulassung }
    assert_redirected_to course_path(assigns(:course))
  end

  test "should destroy course" do
    assert_difference('Course.count', -1) do
      delete :destroy, id: @course
    end

    assert_redirected_to courses_path
  end
end
