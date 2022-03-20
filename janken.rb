class Janken
def initialize
  @j_self = ["グー","チョキ","パー"]
  @j_opponent = ["グー","チョキ","パー"]
  @fing_dir = ["上","下","左","右"]
  @face_dir =  ["上","下","左","右"]
end

#じゃんけん処理
def janken
  puts "じゃんけん"
  puts "0（グー）1（チョキ）2（パー）3（戦わない）"
  @j_num = gets.to_i
  puts "ホイ!"
  kasen
  condition_j
end

#条件分岐（ジャンケン）
def condition_j
  #相手のジャンケンのランダム選択
  t = @j_opponent.sample
  case @j_num
  when 0
    puts "あなた：グーを出しました"
    case t
    when "グー"
      puts "相手：グーを出しました"
      aiko
    when "チョキ"
      puts "相手：チョキを出しました"
      yubisashi
    when "パー"
      puts "相手：パーを出しました"
      kaomuke
    end
  when 1
    puts "あなた：チョキを出しました"
    case t
    when "グー"
      puts "相手：グーを出しました"
      kaomuke
    when "チョキ"
      puts "相手：チョキを出しました"
      aiko
    when "パー"
      puts "相手：パーを出しました"
      yubisashi
    end
  when 2
    puts "あなた：パーを出しました"
    case t
    when "グー"
      puts "相手：グーを出しました"
      yubisashi
    when "チョキ"
      puts "相手：チョキを出しました"
      kaomuke
    when "パー"
      puts "相手：パーを出しました"
      aiko
    end
  when 3
    puts "じゃんけんを回避しました"
  else
    puts "0〜3を選んでください"
  end

end

#条件分岐（ジャンケン勝利後の指差し）
def condition_fing
  if @fing_num == @face_num
    puts "あなたの勝ちです"
  else
    janken
  end
end

#条件分岐（ジャンケン敗北後の顔向け）
def condition_face
  if @face_num == @fing_num
    puts "あなたの負けです"
  else
    janken
  end
end

#あいこ処理（ジャンケンがあいこの時）
def aiko
  puts "あいこで..."
  puts "0（グー）1（チョキ）2（パー）3（戦わない）"
  @j_num = gets.to_i
  puts "ショ!"
  kasen
  condition_j
end

#指差し処理（ジャンケンに勝った時）
def yubisashi
  puts "あっち向いて〜"
  puts "0（上）1（下）2（左）3（右）"
  @fing_num = gets.to_i
  @face_num = rand(4)
  puts "ホイ!"
  kasen
  puts "あなた：#{@fing_dir[@fing_num]}"
  puts "相手：#{@face_dir[@face_num]}"
  condition_fing
end

#顔向け処理（ジャンケンに負けた時）
def kaomuke
  puts "あっち向いて〜"
  puts "0（上）1（下）2（左）3（右）"
  @face_num = gets.to_i
  @fing_num = rand(4)
  puts "ホイ!"
  kasen
  puts "あなた：#{@face_dir[@face_num]}"
  puts "相手：#{@fing_dir[@fing_num]}"
  condition_face
end

#下線描画
def kasen
  puts "-------------------"
end

#メインメソッド
def main
  janken
end

end

#インスタンス化
j = Janken.new
j.main()
