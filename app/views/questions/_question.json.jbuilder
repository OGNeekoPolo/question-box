json.extract! questions, :id, :title, :body, :user_id, :created_at, :updated_at
json.url question_url(questions, format: :json)
