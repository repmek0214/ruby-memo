require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

loop do
    memo_type = gets&.to_i
    if memo_type == 1

        puts "ファイル名を入力してください"
        fileName = gets&.chomp

        puts "メモしたい内容を入力してください"
        puts "入力完了後Enterを押して保存します"        
        memoContain = gets&.chomp

        CSV.open("#{fileName}.csv","w", :encoding => "sjis") do |csv|
        csv << [memoContain]
        end
        break

    elsif memo_type == 2
        puts "編集するメモのファイル名を記入してください"
        fileName = gets&.chomp

        if File.exist?("#{fileName}.csv")
            puts "メモしたい内容を入力してください"
            puts "入力完了後Enterを押して保存します"   
            memoContain = gets&.chomp

            CSV.open("#{fileName}.csv","a", :encoding => "sjis") do |csv|
            csv << [memoContain]
            end
            break

        else
            puts "ファイルが見つかりません。"
        end

    else
        puts "無効な入力です。もう一度試してください。"
        puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"
    end
end


