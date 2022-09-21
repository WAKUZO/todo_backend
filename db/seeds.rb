# Taskの初期値を3つ作成
3.times do |i|
  Todo.create(title: "タスク#{i + 1}", is_done: false)
end