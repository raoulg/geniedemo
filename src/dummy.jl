using SQLite

db = SQLite.DB("data/instagram_dummy.db")

SQLite.execute(db, "CREATE TABLE IF NOT EXISTS campaigns
(id INTEGER PRIMARY KEY, startdate DATE, msg TEXT, img_url, campaign TEXT, campaign_url TEXT, influencer TEXT)")

SQLite.execute(db, "INSERT INTO campaigns (startdate, msg, img_url, campaign, campaign_url, influencer)
    VALUES (
        '2022-08-05', 
        '#elianamichaelichen #eliana #photooftheday #art #maedemenina #like4like #vida #photography #kids #instagram #picoftheday #amor #gold #aviation #fashion #baby #instagood #dia #diario #diary #bomdia #love #bomb #diamond #bomdever_flower',
        'img/01.png',
        'fashion',
        'https://www.instagram.com/p/Cg39qUfuoq9/',
        'elianamaravilhosa')
    ")


SQLite.execute(db, "INSERT INTO campaigns (startdate, msg, img_url, campaign, campaign_url, influencer)
    VALUES (
        '2022-08-05', 
        'Whatever you do, stay adventurous ✌️
        .
        .
        .
        @stephenxwright 
        .
        .
        .
        #roamwild #folkscenery #tlpicks #roamtheplanet #awesome_earthpix #discovernature #visualsoflife #folkgood #getoutside #exploretocreate #lifeofadventure #welivetoexplore #ig_color #goneoutdoors #awakethesoul #exploreiceland #creatorcircuit #ourplanetdaily #travelawesome #voyaged #wonderful_places #thevisualscollective #stayandwander #socality #iceland #skogafoss',
        'img/02.png',
        'travel',
        'https://www.instagram.com/p/CgxDsgkq46b/',
        'trollexpeditions'
        )

    ")

SQLite.execute(db, "CREATE TABLE IF NOT EXISTS comments
(id INTEGER PRIMARY KEY, campaign INTEGER, influencer TEXT, comment TEXT)")

SQLite.execute(db, "INSERT INTO comments (campaign, influencer, comment)
    VALUES (
        1,
        'elianamaravilhosa',
        '👏 Bom dia Lindonaaaaa 🔥🔥')
    ")

SQLite.execute(db, "INSERT INTO comments (campaign, influencer, comment)
    VALUES (
        1,
        'elianamaravilhosa',
        'Sabe ser linda 😍')
    ")

SQLite.execute(db, "INSERT INTO comments (campaign, influencer, comment)
    VALUES (
        2,
        'trollexpeditions',
        'Thanks for sharing ✌️')
    ")

SQLite.execute(db, "INSERT INTO comments (campaign, influencer, comment)
    VALUES (
        2,
        'trollexpeditions',
        'Beautiful 👏🔥')
    ")