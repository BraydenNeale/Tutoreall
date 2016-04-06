# Perth - as per http://www.whitecollar.com.au/perth_regions.pdf

# rails c 
# load './db/scripts/perth.rb'

# area copy script - get lat/long info onto heroku
# f = File.new("./db/scripts/area_copy.rb", 'w')
# Area.all.each do |area|
#   f << "Area.create :name => \"#{area.name}\", :code => \"#{area.code}\", :city => \"#{area.city}\", :state => \"#{area.state}\", :region => \"#{area.region}\", :latitude => #{area.latitude}, :longitude => #{area.longitude}\n"
# end

# CBD
Area.create :name => "perth city", :code => "6000", :city => "perth", :state => "WA", :region => "cbd"
Area.create :name => "highgate", :code => "6003", :city => "perth", :state => "WA", :region => "cbd"
Area.create :name => "east perth", :code => "6004", :city => "perth", :state => "WA", :region => "cbd"
# Area.create :name => "kings park", :code => "6005"

# South East Perth (6100 - 6147)
Area.create :name => "burswood", :code => "6100", :city => "perth", :state => "WA", :region => "south east perth"
Area.create :name => "carlisle", :code => "6101", :city => "perth", :state => "WA", :region => "south east perth"
Area.create :name => "bentley", :code => "6102", :city => "perth", :state => "WA", :region =>"south east perth"
Area.create :name => "rivervale", :code => "6103", :city => "perth", :state => "WA", :region =>  "south east perth"
Area.create :name => "ascot", :code => "6104", :city => "perth", :state => "WA", :region => "south east perth"
Area.create :name => "cloverdale", :code => "6105", :city => "perth", :state => "WA", :region => "south east perth"
Area.create :name => "welshpool", :code => "6106", :city => "perth", :state => "WA", :region => "south east perth"
Area.create :name => "beckenham", :code => "6107", :city => "perth", :state => "WA", :region => "south east perth"
Area.create :name => "thornlie", :code => "6108", :city => "perth", :state => "WA", :region => "south east perth"
Area.create :name => "maddington", :code => "6109", :city => "perth", :state => "WA", :region => "south east perth"
Area.create :name => "gosnells", :code => "6110", :city => "perth", :state => "WA", :region => "south east perth"
Area.create :name => "ashendon", :code => "6111", :city => "perth", :state => "WA", :region => "south east perth"
Area.create :name => "armadale", :code => "6112", :city => "perth", :state => "WA", :region => "south east perth"
Area.create :name => "langford", :code => "6147", :city => "perth", :state => "WA", :region => "south east perth"

# South West Perth (6148 - 6170)
Area.create :name => "ferndale", :code => "6148", :city => "perth", :state => "WA", :region => "south west perth"
Area.create :name => "bullcreek", :code => "6149", :city => "perth", :state => "WA", :region => "south west perth"
Area.create :name => "batemen", :code => "6150", :city => "perth", :state => "WA", :region => "south west perth"
Area.create :name => "kensington", :code => "6151", :city => "perth", :state => "WA", :region => "south west perth"
Area.create :name => "como", :code => "6152", :city => "perth", :state => "WA", :region => "south west perth"
Area.create :name => "applecross", :code => "6153", :city => "perth", :state => "WA", :region => "south west perth"
Area.create :name => "alfred cove", :code => "6154", :city => "perth", :state => "WA", :region => "south west perth"
Area.create :name => "canning vale", :code => "6155", :city => "perth", :state => "WA", :region => "south west perth"
Area.create :name => "attadale", :code => "6156", :city => "perth", :state => "WA", :region => "south west perth"
Area.create :name => "bicton", :code => "6157", :city => "perth", :state => "WA", :region => "south west perth"
Area.create :name => "east fremantle", :code => "6158", :city => "perth", :state => "WA", :region => "south west perth"
Area.create :name => "fremantle", :code => "6160", :city => "perth", :state => "WA", :region => "south west perth"
Area.create :name => "rottnest island", :code => "6161", :city => "perth", :state => "WA", :region => "south west perth"
Area.create :name => "beaconsfield", :code => "6162", :city => "perth", :state => "WA", :region => "south west perth"
Area.create :name => "bibra lake", :code => "6163", :city => "perth", :state => "WA", :region => "south west perth"
Area.create :name => "atwell", :code => "6164", :city => "perth", :state => "WA", :region => "south west perth"
Area.create :name => "hope valley", :code => "6165", :city => "perth", :state => "WA", :region => "south west perth"
Area.create :name => "coogee", :code => "6166", :city => "perth", :state => "WA", :region => "south west perth"
Area.create :name => "anketell", :code => "6167", :city => "perth", :state => "WA", :region => "south west perth"
Area.create :name => "leda", :code => "6170", :city => "perth", :state => "WA", :region => "south west perth"

# North West Perth (6007 - 6159)
Area.create :name => "leederville", :code => "6007", :city => "perth", :state => "WA", :region => "north west perth"
Area.create :name => "daglish", :code => "6008", :city => "perth", :state => "WA", :region => "north west perth"
Area.create :name => "crawley", :code => "6009", :city => "perth", :state => "WA", :region => "north west perth"
Area.create :name => "claremont", :code => "6010", :city => "perth", :state => "WA", :region => "north west perth"
Area.create :name => "cottesloe", :code => "6011", :city => "perth", :state => "WA", :region => "north west perth"
Area.create :name => "mosman park", :code => "6012", :city => "perth", :state => "WA", :region => "north west perth"
Area.create :name => "floreat", :code => "6014", :city => "perth", :state => "WA", :region => "north west perth"
Area.create :name => "city beach", :code => "6015", :city => "perth", :state => "WA", :region => "north west perth"
Area.create :name => "glendalough", :code => "6016", :city => "perth", :state => "WA", :region => "north west perth"
Area.create :name => "herdsman", :code => "6017", :city => "perth", :state => "WA", :region => "north west perth"
Area.create :name => "churchlands", :code => "6018", :city => "perth", :state => "WA", :region => "north west perth"
Area.create :name => "scarborough", :code => "6019", :city => "perth", :state => "WA", :region => "north west perth"
Area.create :name => "carine", :code => "6020", :city => "perth", :state => "WA", :region => "north west perth"
Area.create :name => "hamersly", :code => "6022", :city => "perth", :state => "WA", :region => "north west perth"
Area.create :name => "duncraig", :code => "6023", :city => "perth", :state => "WA", :region => "north west perth"
Area.create :name => "greenwood", :code => "6024", :city => "perth", :state => "WA", :region => "north west perth"
Area.create :name => "craigie", :code => "6025", :city => "perth", :state => "WA", :region => "north west perth"
Area.create :name => "kingsley", :code => "6026", :city => "perth", :state => "WA", :region => "north west perth"
Area.create :name => "beldon", :code => "6027", :city => "perth", :state => "WA", :region => "north west perth"
Area.create :name => "burns beach", :code => "6028", :city => "perth", :state => "WA", :region => "north west perth"
Area.create :name => "trigg", :code => "6029", :city => "perth", :state => "WA", :region => "north west perth"
Area.create :name => "north fremantle", :code => "6159", :city => "perth", :state => "WA", :region => "north west perth"
Area.create :name => "nedlands", :code => "6907", :city => "perth", :state => "WA", :region => "north west perth"

# North East Perth (6006 - 6062)
Area.create :name => "north perth", :code => "6006", :city => "perth", :state => "WA", :region => "north east perth"
Area.create :name => "balcatta", :code => "6021", :city => "perth", :state => "WA", :region => "north east perth"
Area.create :name => "coolbinia", :code => "6050", :city => "perth", :state => "WA", :region => "north east perth"
Area.create :name => "maylands", :code => "6051", :city => "perth", :state => "WA", :region => "north east perth"
Area.create :name => "bedford", :code => "6052", :city => "perth", :state => "WA", :region => "north east perth"
Area.create :name => "bayswater", :code => "6053", :city => "perth", :state => "WA", :region => "north east perth"
Area.create :name => "ashfield", :code => "6054", :city => "perth", :state => "WA", :region => "north east perth"
Area.create :name => "dianella", :code => "6059", :city => "perth", :state => "WA", :region => "north east perth"
Area.create :name => "joondanna", :code => "6060", :city => "perth", :state => "WA", :region => "north east perth"
Area.create :name => "balga", :code => "6061", :city => "perth", :state => "WA", :region => "north east perth"
Area.create :name => "embleton", :code => "6062", :city => "perth", :state => "WA", :region => "north east perth"

# Serpentine - Jarrahdale (6121 - 6126)
Area.create :name => "oakford", :code => "6121", :city => "perth", :state => "WA", :region => "serpentine - jarrahdale"
Area.create :name => "byford", :code => "6122", :city => "perth", :state => "WA", :region => "serpentine - jarrahdale"
Area.create :name => "mundijong", :code => "6123", :city => "perth", :state => "WA", :region => "serpentine - jarrahdale"
Area.create :name => "jarrahdale", :code => "6124", :city => "perth", :state => "WA", :region => "serpentine - jarrahdale"
Area.create :name => "keysbrook", :code => "6126", :city => "perth", :state => "WA", :region => "serpentine - jarrahdale"

# Kalamunda
Area.create :name => "high wycombe", :code => "6057", :city => "perth", :state => "WA", :region => "kalamunda"
Area.create :name => "forrestfield", :code => "6058", :city => "perth", :state => "WA", :region => "kalamunda"
Area.create :name => "bickley", :code => "6076", :city => "perth", :state => "WA", :region => "kalamunda"

# Mundaring (6070 - 6558)
Area.create :name => "darlington", :code => "6070", :city => "perth", :state => "WA", :region => "mundaring"
Area.create :name => "glen forrest", :code => "6071", :city => "perth", :state => "WA", :region => "mundaring"
Area.create :name => "mahogany creek", :code => "6072", :city => "perth", :state => "WA", :region => "mundaring"
Area.create :name => "mundaring", :code => "6073", :city => "perth", :state => "WA", :region => "mundaring"
Area.create :name => "sawyers valley", :code => "6074", :city => "perth", :state => "WA", :region => "mundaring"
Area.create :name => "parkerville", :code => "6081", :city => "perth", :state => "WA", :region => "mundaring"
Area.create :name => "bailup", :code => "6082", :city => "perth", :state => "WA", :region => "mundaring"
Area.create :name => "beechina", :code => "6556", :city => "perth", :state => "WA", :region => "mundaring"
Area.create :name => "wooroloo", :code => "6558", :city => "perth", :state => "WA", :region => "mundaring"

# Swan (6055 - 6090)
Area.create :name => "caversham", :code => "6055", :city => "perth", :state => "WA", :region => "swan"
Area.create :name => "baskerville", :code => "6056", :city => "perth", :state => "WA", :region => "swan"
Area.create :name => "beechboro", :code => "6063", :city => "perth", :state => "WA", :region => "swan"
Area.create :name => "ballajura", :code => "6066", :city => "perth", :state => "WA", :region => "swan"
Area.create :name => "callacabardee", :code => "6067", :city => "perth", :state => "WA", :region => "swan"
Area.create :name => "whiteman", :code => "6068", :city => "perth", :state => "WA", :region => "swan"
Area.create :name => "avely", :code => "6069", :city => "perth", :state => "WA", :region => "swan"
Area.create :name => "lexia", :code => "6079", :city => "perth", :state => "WA", :region => "swan"
Area.create :name => "gidgegannup", :code => "6083", :city => "perth", :state => "WA", :region => "swan"
#Area.create :name => "avon valley national park", :code => "6084" ?
Area.create :name => "malaga", :code => "6090", :city => "perth", :state => "WA", :region => "swan"

# Rockingham (6168 - 6182)
Area.create :name => "cooloongup", :code => "6168", :city => "perth", :state => "WA", :region => "rockingham"
Area.create :name => "safety bay", :code => "6169", :city => "perth", :state => "WA", :region => "rockingham"
Area.create :name => "baldivis", :code => "6171", :city => "perth", :state => "WA", :region => "rockingham"
Area.create :name => "port kennedy", :code => "6172", :city => "perth", :state => "WA", :region => "rockingham"
Area.create :name => "secret harbour", :code => "6173", :city => "perth", :state => "WA", :region => "rockingham"
Area.create :name => "golden bay", :code => "6174", :city => "perth", :state => "WA", :region => "rockingham"
Area.create :name => "singleton", :code => "6175", :city => "perth", :state => "WA", :region => "rockingham"
Area.create :name => "karnup", :code => "6176", :city => "perth", :state => "WA", :region => "rockingham"
Area.create :name => "keralup", :code => "6182", :city => "perth", :state => "WA", :region => "rockingham"

# Wanneroo (6030 - 6078)
Area.create :name => "clarkson", :code => "6030", :city => "perth", :state => "WA", :region => "wanneroo"
Area.create :name => "banksia grove", :code => "6031", :city => "perth", :state => "WA", :region => "wanneroo"
Area.create :name => "nowergup", :code => "6032", :city => "perth", :state => "WA", :region => "wanneroo"
Area.create :name => "carabooda", :code => "6033", :city => "perth", :state => "WA", :region => "wanneroo"
Area.create :name => "yanchep", :code => "6035", :city => "perth", :state => "WA", :region => "wanneroo"
Area.create :name => "butler", :code => "6036", :city => "perth", :state => "WA", :region => "wanneroo"
Area.create :name => "two rocks", :code => "6037", :city => "perth", :state => "WA", :region => "wanneroo"
Area.create :name => "alexander heights", :code => "6064", :city => "perth", :state => "WA", :region => "wanneroo"
Area.create :name => "ashby", :code => "6065", :city => "perth", :state => "WA", :region => "wanneroo"
Area.create :name => "gnangara", :code => "6077", :city => "perth", :state => "WA", :region => "wanneroo"
Area.create :name => "mariginiup", :code => "6078", :city => "perth", :state => "WA", :region => "wanneroo"