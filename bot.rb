require 'telegram/bot'

TOKEN = '602319697:AAG2cAOdUfy4kXf4sDeu0IbfZHWAU9tCOJ0'

Telegram::Bot::Client.run(TOKEN) do |bot|
    bot.listen do |message|
        puts message
        bot.api.send_message(
            chat_id: message.chat.id,
            text: "Привет, #{message.from.first_name}"
        )
    end
end
