require 'test_helper'

class OcrsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ocr = ocrs(:one)
  end

  test "should get index" do
    get ocrs_url, as: :json
    assert_response :success
  end

  test "should create ocr" do
    assert_difference('Ocr.count') do
      post ocrs_url, params: { ocr: { image_ref: @ocr.image_ref } }, as: :json
    end

    assert_response 201
  end

  test "should show ocr" do
    get ocr_url(@ocr), as: :json
    assert_response :success
  end

  test "should update ocr" do
    patch ocr_url(@ocr), params: { ocr: { image_ref: @ocr.image_ref } }, as: :json
    assert_response 200
  end

  test "should destroy ocr" do
    assert_difference('Ocr.count', -1) do
      delete ocr_url(@ocr), as: :json
    end

    assert_response 204
  end
end
