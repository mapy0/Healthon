namespace :whenever_test do  # ファイル名と合わせること
  desc 'テスト'
  task test: :environment do
    # ここに定期実行する処理を記述する。
    puts 'hoge'

    members = Member.all
    members.each do |member|
      # member no saishinn no date no 1 kken wo syutoku
      record = member.records.order(date: :asc).last
      case record.bf
      when 0..14 then
        # Group update
        community = Community.find_by(name: 'Hiyoko')
        member.update(community_id: community.id)
      when 14..16 then
        #
      when 16..18 then
        #
      when 18..20 then
        #
      when 20..22 then
      when 22..24 then
      when 24..26 then
      when 26..28 then
      when 28..30 then
      when 30..32 then
      when 32..35 then
      else
        # 35..100
      end

    end

  end
end