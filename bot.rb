require 'telegram/bot'

TOKEN = '602319697:AAG2cAOdUfy4kXf4sDeu0IbfZHWAU9tCOJ0'

ANSWERS = [
    'Да',
    'Нет',
    'Может быть',
    'Попробуй',
    'Да, конечно',
    'У меня все хорошо'
]

def answer(message)
    if message.text == 'Привет'
        "Привет, #{message.from.first_name}"
    elsif message.text == 'На каком языке ты написан?'
        "Ruby"
    elsif message.text == 'Кто твой автор?'
        "Nastya"
    elsif message.text == 'Сколько времени?'
        Time.now.strftime("%T")
    elsif message.text == 'Какой сегодня день недели?'
        Date.today.strftime("%A")
    elsif message.text == 'Сколько времени будет через час?'
        (Time.now + 1*60*60).strftime("%T")
    else
        ANSWERS.sample
    end
end


Telegram::Bot::Client.run(TOKEN) do |bot|
    bot.listen do |message|
        puts message
        bot.api.send_message(
            chat_id: message.chat.id,
            text: answer(message)
        )
    end
end
