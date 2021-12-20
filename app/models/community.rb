class Community < ApplicationRecord
  has_many :members, dependent: :destroy
  
#Communityを指定するためにnameを定義しておく
CommunityA, CommunityB, CommunityC, CommunityD, CommunityE, CommunityF, CommunityG, CommunityH, CommunityI, CommunityJ, CommunityK = 
%w[community_a, community_b ,community_c, community_d, community_f, community_g, community_h, community_i, community_j, community_k].
map{|name| find_by(name: name) }
#community_a,community_b,,,,,の配列のnameに書くnameを探してきてCommunityA,CommunityB,,,,に展開（代入）する？


 Condition = [[0,14,CommunityA], [14,16,CommunityB], [16,18,CommunityC],[18,20,CommunityD],[22,24,CommunityE],[24,26,CommunityF],[26,28,CommunityG],[28,30,CommunityH],[30,32,CommunityI],[32,35,CommunityJ],[35,100,CommunityK]]


def self.sort member
sql =
'SELECT
    member_id, bf
  FROM
    records
    INNER JOIN (SELECT
                  member_id,
                  MAX(date) AS max_date
                FROM
                    records
                GROUP BY
                    member_id) AS max_table
    ON max_table.member_id = records.member_id
    AND max_table.date = records.date;'
  
ActiveRecord::Base.connection.execute(sql).to_element 

Condition.each{ | from,to,community | 
   where("element >= ? and element< ? and community " ,from,to ).update_all(community_id:community.id) 
}
end
  
end
