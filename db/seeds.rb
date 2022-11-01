# frozen_string_literal: true

# Create admin user

admin = Admin.create username: 'admin', password: 'admin', password_confirmation: 'admin'
UserProfile.create(user: admin, email: 'admin@mail.com')
# Create player user

player = Player.create username: 'player', password: 'player', password_confirmation: 'player'
UserProfile.create(user: player, email: 'player@mail.com')

# Create sports

football = Sport.create name: 'Football'
basketball = Sport.create name: 'Basketball'
Sport.create name: 'League of Legends'
csgo = Sport.create name: 'Counter Strike: Global Offensive'
Sport.create name: 'Tennis'
tabletennis = Sport.create name: 'Table tennis'
Sport.create name: 'Baseball'
Sport.create name: 'Volleyball'
Sport.create name: 'Boxing'
Sport.create name: 'Table tennis'
Sport.create name: 'Rugby'
Sport.create name: 'Cycling'
Sport.create name: 'Dota 2'
Sport.create name: 'Rocket League'
Sport.create name: 'Overwatch'
Sport.create name: 'Valorant'

# Create countries

Country.create name: 'Afghanistan'
Country.create name: 'Albania'
Country.create name: 'Algeria'
Country.create name: 'Andorra'
Country.create name: 'Angola'
Country.create name: 'Antigua & Deps'
argentina = Country.create name: 'Argentina'
Country.create name: 'Armenia'
australia = Country.create name: 'Australia'
Country.create name: 'Austria'
Country.create name: 'Azerbaijan'
Country.create name: 'Bahamas'
Country.create name: 'Bahrain'
Country.create name: 'Bangladesh'
Country.create name: 'Barbados'
Country.create name: 'Belarus'
belgium = Country.create name: 'Belgium'
Country.create name: 'Belize'
Country.create name: 'Benin'
Country.create name: 'Bhutan'
Country.create name: 'Bolivia'
Country.create name: 'Bosnia Herzegovina'
Country.create name: 'Botswana'
brazil = Country.create name: 'Brazil'
Country.create name: 'Brunei'
Country.create name: 'Bulgaria'
Country.create name: 'Burkina'
Country.create name: 'Burundi'
Country.create name: 'Cambodia'
cameroon = Country.create name: 'Cameroon'
canada = Country.create name: 'Canada'
Country.create name: 'Cape Verde'
Country.create name: 'Central African Rep'
Country.create name: 'Chad'
Country.create name: 'Chile'
Country.create name: 'China'
Country.create name: 'Colombia'
Country.create name: 'Comoros'
Country.create name: 'Congo'
Country.create name: 'Congo {Democratic Rep}'
cr = Country.create name: 'Costa Rica'
croatia = Country.create name: 'Croatia'
Country.create name: 'Cuba'
Country.create name: 'Cyprus'
Country.create name: 'Czech Republic'
denmark = Country.create name: 'Denmark'
Country.create name: 'Djibouti'
Country.create name: 'Dominica'
Country.create name: 'Dominican Republic'
Country.create name: 'East Timor'
ecuador = Country.create name: 'Ecuador'
Country.create name: 'Egypt'
Country.create name: 'El Salvador'
Country.create name: 'Equatorial Guinea'
Country.create name: 'Eritrea'
Country.create name: 'Estonia'
Country.create name: 'Ethiopia'
Country.create name: 'Fiji'
Country.create name: 'Finland'
france = Country.create name: 'France'
Country.create name: 'Gabon'
Country.create name: 'Gambia'
Country.create name: 'Georgia'
germany = Country.create name: 'Germany'
ghana = Country.create name: 'Ghana'
Country.create name: 'Greece'
Country.create name: 'Grenada'
Country.create name: 'Guatemala'
Country.create name: 'Guinea'
Country.create name: 'Guinea-Bissau'
Country.create name: 'Guyana'
Country.create name: 'Haiti'
Country.create name: 'Honduras'
Country.create name: 'Hungary'
Country.create name: 'Iceland'
Country.create name: 'India'
Country.create name: 'Indonesia'
iran = Country.create name: 'Iran'
Country.create name: 'Iraq'
Country.create name: 'Ireland {Republic}'
Country.create name: 'Israel'
Country.create name: 'Italy'
Country.create name: 'Ivory Coast'
Country.create name: 'Jamaica'
japan = Country.create name: 'Japan'
Country.create name: 'Jordan'
Country.create name: 'Kazakhstan'
Country.create name: 'Kenya'
Country.create name: 'Kiribati'
Country.create name: 'Korea North'
sk = Country.create name: 'Korea South'
Country.create name: 'Kosovo'
Country.create name: 'Kuwait'
Country.create name: 'Kyrgyzstan'
Country.create name: 'Laos'
Country.create name: 'Latvia'
Country.create name: 'Lebanon'
Country.create name: 'Lesotho'
Country.create name: 'Liberia'
Country.create name: 'Libya'
Country.create name: 'Liechtenstein'
Country.create name: 'Lithuania'
Country.create name: 'Luxembourg'
Country.create name: 'Macedonia'
Country.create name: 'Madagascar'
Country.create name: 'Malawi'
Country.create name: 'Malaysia'
Country.create name: 'Maldives'
Country.create name: 'Mali'
Country.create name: 'Malta'
Country.create name: 'Marshall Islands'
Country.create name: 'Mauritania'
Country.create name: 'Mauritius'
mexico = Country.create name: 'Mexico'
Country.create name: 'Micronesia'
Country.create name: 'Moldova'
Country.create name: 'Monaco'
Country.create name: 'Mongolia'
Country.create name: 'Montenegro'
morocco = Country.create name: 'Morocco'
Country.create name: 'Mozambique'
Country.create name: 'Myanmar, {Burma}'
Country.create name: 'Namibia'
Country.create name: 'Nauru'
Country.create name: 'Nepal'
netherlands = Country.create name: 'Netherlands'
nz = Country.create name: 'New Zealand'
Country.create name: 'Nicaragua'
Country.create name: 'Niger'
Country.create name: 'Nigeria'
Country.create name: 'Norway'
Country.create name: 'Oman'
Country.create name: 'Pakistan'
Country.create name: 'Palau'
Country.create name: 'Panama'
Country.create name: 'Papua New Guinea'
Country.create name: 'Paraguay'
peru = Country.create name: 'Peru'
Country.create name: 'Philippines'
poland = Country.create name: 'Poland'
portugal = Country.create name: 'Portugal'
qatar = Country.create name: 'Qatar'
Country.create name: 'Romania'
Country.create name: 'Russian Federation'
Country.create name: 'Rwanda'
Country.create name: 'St Kitts & Nevis'
Country.create name: 'St Lucia'
Country.create name: 'Saint Vincent & the Grenadines'
Country.create name: 'Samoa'
Country.create name: 'San Marino'
Country.create name: 'Sao Tome & Principe'
saudi = Country.create name: 'Saudi Arabia'
senegal = Country.create name: 'Senegal'
serbia = Country.create name: 'Serbia'
Country.create name: 'Seychelles'
Country.create name: 'Sierra Leone'
Country.create name: 'Singapore'
Country.create name: 'Slovakia'
Country.create name: 'Slovenia'
Country.create name: 'Solomon Islands'
Country.create name: 'Somalia'
Country.create name: 'South Africa'
Country.create name: 'South Sudan'
spain = Country.create name: 'Spain'
Country.create name: 'Sri Lanka'
Country.create name: 'Sudan'
Country.create name: 'Suriname'
Country.create name: 'Swaziland'
Country.create name: 'Sweden'
switzerland = Country.create name: 'Switzerland'
Country.create name: 'Syria'
Country.create name: 'Taiwan'
Country.create name: 'Tajikistan'
Country.create name: 'Tanzania'
Country.create name: 'Thailand'
Country.create name: 'Togo'
Country.create name: 'Tonga'
Country.create name: 'Trinidad & Tobago'
tunisia = Country.create name: 'Tunisia'
Country.create name: 'Turkey'
Country.create name: 'Turkmenistan'
Country.create name: 'Tuvalu'
Country.create name: 'Uganda'
Country.create name: 'Ukraine'
uae = Country.create name: 'United Arab Emirates'
uk = Country.create name: 'United Kingdom'
us = Country.create name: 'United States'
uruguay = Country.create name: 'Uruguay'
Country.create name: 'Uzbekistan'
Country.create name: 'Vanuatu'
Country.create name: 'Vatican City'
Country.create name: 'Venezuela'
Country.create name: 'Vietnam'
Country.create name: 'Yemen'
Country.create name: 'Zambia'
Country.create name: 'Zimbabwe'

# Create teams

tqatar = Team.create name: 'Qatar', country: qatar
tgermany = Team.create name: 'Germany', country: germany
tdenmark = Team.create name: 'Denmark', country: denmark
tbrazil = Team.create name: 'Brazil', country: brazil
tfrance = Team.create name: 'France', country: france
tbelgium = Team.create name: 'Belgium', country: belgium
tcroatia = Team.create name: 'Croatia', country: croatia
tspain = Team.create name: 'Spain', country: spain
tserbia = Team.create name: 'Serbia', country: serbia
tengland = Team.create name: 'England', country: uk
tswitzerland = Team.create name: 'Switzerland', country: switzerland
tnetherlands = Team.create name: 'Netherlands', country: netherlands
targentina = Team.create name: 'Argentina', country: argentina
tiran = Team.create name: 'Iran', country: iran
tsk = Team.create name: 'South Korea', country: sk
tjapan = Team.create name: 'Japan', country: japan
tsaudi = Team.create name: 'Saudi Arabia', country: saudi
tecuador = Team.create name: 'Ecuador', country: ecuador
turuguay = Team.create name: 'Uruguay', country: uruguay
tcanada = Team.create name: 'Canada', country: canada
tghana = Team.create name: 'Ghana', country: ghana
tsenegal = Team.create name: 'Senegal', country: senegal
tportugal = Team.create name: 'Portugal', country: portugal
tpoland = Team.create name: 'Poland', country: poland
ttunisia = Team.create name: 'Tunisia', country: tunisia
tmorocco = Team.create name: 'Morocco', country: morocco
tcameroon = Team.create name: 'Cameroon', country: cameroon
tus = Team.create name: 'United States', country: us
tmexico = Team.create name: 'Mexico', country: mexico
twales = Team.create name: 'Wales', country: uk
taustralia = Team.create name: 'Australia', country: australia
tuae = Team.create name: 'United Arab Emirates', country: uae
tperu = Team.create name: 'Peru', country: peru
tcr = Team.create name: 'Costa Rica', country: cr
tnz = Team.create name: 'New Zealand', country: nz

# Create tournaments

worldcup = Tournament.create name: 'FIFA World Cup 2022', sport: football
Tournament.create name: 'Copa América 2021', sport: football
Tournament.create name: 'FIBA Basketball World Cup 2019', sport: basketball
Tournament.create name: 'IEM Rio Major 2022', sport: csgo
Tournament.create name: 'World Table Tennis Championship 2022', sport: tabletennis

# Create scores

Score.create player: player, tournament:worldcup 

# Create stages

groups = Stage.create name: 'Group stage', penalties: false, tournament: worldcup
Stage.create name: 'Round of 16', penalties: true, tournament: worldcup
Stage.create name: 'Quarter-finals', penalties: true, tournament: worldcup
Stage.create name: 'Semi-finals', penalties: true, tournament: worldcup
Stage.create name: 'Third place play-off', penalties: true, tournament: worldcup
Stage.create name: 'Final', penalties: true, tournament: worldcup

# Create matches

Match.create date: '2022/11/21', time: '07:00', home: tsenegal, away: tnetherlands, stage: groups
Match.create date: '2022/11/21', time: '10:00', home: tengland, away: tiran, stage: groups
Match.create date: '2022/11/21', time: '13:00', home: tqatar, away: tecuador, stage: groups
Match.create date: '2022/11/21', time: '16:00', home: tus, away: twales, stage: groups
Match.create date: '2022/11/22', time: '07:00', home: targentina, away: tsaudi, stage: groups
Match.create date: '2022/11/22', time: '10:00', home: tdenmark, away: ttunisia, stage: groups
Match.create date: '2022/11/22', time: '13:00', home: tmexico, away: tpoland, stage: groups
Match.create date: '2022/11/22', time: '16:00', home: tfrance, away: nil, stage: groups
Match.create date: '2022/11/23', time: '07:00', home: tmorocco, away: tcroatia, stage: groups
Match.create date: '2022/11/23', time: '10:00', home: tgermany, away: tjapan, stage: groups
Match.create date: '2022/11/23', time: '13:00', home: tspain, away: nil, stage: groups
Match.create date: '2022/11/23', time: '16:00', home: tbelgium, away: tcanada, stage: groups
Match.create date: '2022/11/24', time: '07:00', home: tswitzerland, away: tcameroon, stage: groups
Match.create date: '2022/11/24', time: '10:00', home: turuguay, away: tsk, stage: groups
Match.create date: '2022/11/24', time: '13:00', home: tportugal, away: tghana, stage: groups
Match.create date: '2022/11/24', time: '16:00', home: tbrazil, away: tserbia, stage: groups
