json.extract! answers, :id, :body, :user_id, :question_id, :created_at, :updated_at
json.url answer_url(answers, format: :json)
