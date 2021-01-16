require "test_helper"

class CatsControllerTest < ActionDispatch::IntegrationTest
  test "query cat update" do
    cat = Cat.create(name: "Whiskers")
    put "/cats/query/#{cat.id}"

    assert_equal "Whiskers", cat.reload.name # Cat not updated
  end

  test "local var cat update" do
    cat = Cat.create(name: "Whiskers")
    put "/cats/local/#{cat.id}"

    assert_equal "Tabby", cat.reload.name # Cat updated
  end

  test "memoized cat update" do
    cat = Cat.create(name: "Whiskers")
    put "/cats/memo/#{cat.id}"

    assert_equal "Tabby", cat.reload.name # Cat updated
  end
end
