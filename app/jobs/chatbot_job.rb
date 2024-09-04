class ChatbotJob < ApplicationJob
  queue_as :default

  def perform(question)
    @garments = Garment.all.map { |garment| "#{garment.ai_description} (#{garment.id})" }.join(" ")
    @question = question
    chatgpt_response = client.chat(
      parameters: {
        model: "gpt-4o",
        messages: questions_formatted_for_openai
      }
    )
    new_content = chatgpt_response["choices"][0]["message"]["content"]

    question.update(ai_answer: new_content)
    Turbo::StreamsChannel.broadcast_update_to(
      "question_#{@question.id}",
      target: "question_#{@question.id}",
      partial: "questions/question", locals: { question: question })
  end

  private

  def client
    @client ||= OpenAI::Client.new
  end

  def questions_formatted_for_openai
    @garments = Garment.all.map { |garment| "#{garment.ai_description} (#{garment.id})" }.join(" ")
    questions = @question.user.questions
    results = []
    results << {
      role: "system",
      content:
      "You are a style assistant specializing in clothing.
       User's current wardrobe is described here: #{@garments}.
       Make a recommendation based on the user's wardrobe and explain it in your answer.
      " }
    questions.each do |question|
      results << { role: "user", content: question.user_question }
      results << { role: "assistant", content: question.ai_answer || "" }
    end
    return results
  end
end
