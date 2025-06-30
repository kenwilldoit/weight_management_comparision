require "test_helper"

class WeightsControllerTest < ActionDispatch::IntegrationTest
  test "何も問題ない場合 " do    
    post weights_judge_path, params: { day1: "55", day2: "50" }
    assert_response :success
    assert_select "p", "良い感じです！"
  end

  test "マイナスが入っている場合" do 
    post weights_judge_path, params: { day1: "-55", day2: "-50"  }
    assert_response :success
    assert_select "p", "数値のみ入力してください"
  end

  test "inputに渡された値が文字列の場合" do
    post weights_judge_url, params: { day1: "aaa", day2: "bbb"  }
    assert_response :success
    assert_select "p", "数値のみ入力してください"
  end

  test "inputが空白の場合" do
    post weights_judge_url, params: { day1: "", day2: "" }
    assert_response :success
    assert_select "p", "数値のみ入力してください"
  end

end
