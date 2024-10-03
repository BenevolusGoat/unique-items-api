--By Zamiel (because getting translated names isn't supported yet)
local nameMap = {}

nameMap.Collectibles = {
	[1] = "The Sad Onion",
	[2] = "The Inner Eye",
	[3] = "Spoon Bender",
	[4] = "Cricket's Head",
	[5] = "My Reflection",
	[6] = "Number One",
	[7] = "Blood of the Martyr",
	[8] = "Brother Bobby",
	[9] = "Skatole",
	[10] = "Halo of Flies",
	[11] = "1up!",
	[12] = "Magic Mushroom",
	[13] = "The Virus",
	[14] = "Roid Rage",
	[15] = "<3",
	[16] = "Raw Liver",
	[17] = "Skeleton Key",
	[18] = "A Dollar",
	[19] = "Boom!",
	[20] = "Transcendence",
	[21] = "The Compass",
	[22] = "Lunch",
	[23] = "Dinner",
	[24] = "Dessert",
	[25] = "Breakfast",
	[26] = "Rotten Meat",
	[27] = "Wooden Spoon",
	[28] = "The Belt",
	[29] = "Mom's Underwear",
	[30] = "Mom's Heels",
	[31] = "Mom's Lipstick",
	[32] = "Wire Coat Hanger",
	[33] = "The Bible",
	[34] = "The Book of Belial",
	[35] = "The Necronomicon",
	[36] = "The Poop",
	[37] = "Mr. Boom",
	[38] = "Tammy's Head",
	[39] = "Mom's Bra",
	[40] = "Kamikaze!",
	[41] = "Mom's Pad",
	[42] = "Bob's Rotten Head",
	[44] = "Teleport!",
	[45] = "Yum Heart",
	[46] = "Lucky Foot",
	[47] = "Doctor's Remote",
	[48] = "Cupid's Arrow",
	[49] = "Shoop da Whoop!",
	[50] = "Steven",
	[51] = "Pentagram",
	[52] = "Dr. Fetus",
	[53] = "Magneto",
	[54] = "Treasure Map",
	[55] = "Mom's Eye",
	[56] = "Lemon Mishap",
	[57] = "Distant Admiration",
	[58] = "Book of Shadows",
	[60] = "The Ladder",
	[62] = "Charm of the Vampire",
	[63] = "The Battery",
	[64] = "Steam Sale",
	[65] = "Anarchist Cookbook",
	[66] = "The Hourglass",
	[67] = "Sister Maggy",
	[68] = "Technology",
	[69] = "Chocolate Milk",
	[70] = "Growth Hormones",
	[71] = "Mini Mush",
	[72] = "Rosary",
	[73] = "Cube of Meat",
	[74] = "A Quarter",
	[75] = "PHD",
	[76] = "X-Ray Vision",
	[77] = "My Little Unicorn",
	[78] = "Book of Revelations",
	[79] = "The Mark",
	[80] = "The Pact",
	[81] = "Dead Cat",
	[82] = "Lord of the Pit",
	[83] = "The Nail",
	[84] = "We Need To Go Deeper!",
	[85] = "Deck of Cards",
	[86] = "Monstro's Tooth",
	[87] = "Loki's Horns",
	[88] = "Little Chubby",
	[89] = "Spider Bite",
	[90] = "The Small Rock",
	[91] = "Spelunker Hat",
	[92] = "Super Bandage",
	[93] = "The Gamekid",
	[94] = "Sack of Pennies",
	[95] = "Robo-Baby",
	[96] = "Little C.H.A.D.",
	[97] = "The Book of Sin",
	[98] = "The Relic",
	[99] = "Little Gish",
	[100] = "Little Steven",
	[101] = "The Halo",
	[102] = "Mom's Bottle of Pills",
	[103] = "The Common Cold",
	[104] = "The Parasite",
	[105] = "The D6",
	[106] = "Mr. Mega",
	[107] = "The Pinking Shears",
	[108] = "The Wafer",
	[109] = "Money = Power",
	[110] = "Mom's Contacts",
	[111] = "The Bean",
	[112] = "Guardian Angel",
	[113] = "Demon Baby",
	[114] = "Mom's Knife",
	[115] = "Ouija Board",
	[116] = "9 Volt",
	[117] = "Dead Bird",
	[118] = "Brimstone",
	[119] = "Blood Bag",
	[120] = "Odd Mushroom",
	[121] = "Odd Mushroom",
	[122] = "Whore of Babylon",
	[123] = "Monster Manual",
	[124] = "Dead Sea Scrolls",
	[125] = "Bobby-Bomb",
	[126] = "Razor Blade",
	[127] = "Forget Me Now",
	[128] = "Forever Alone",
	[129] = "Bucket of Lard",
	[130] = "A Pony",
	[131] = "Bomb Bag",
	[132] = "A Lump of Coal",
	[133] = "Guppy's Paw",
	[134] = "Guppy's Tail",
	[135] = "IV Bag",
	[136] = "Best Friend",
	[137] = "Remote Detonator",
	[138] = "Stigmata",
	[139] = "Mom's Purse",
	[140] = "Bob's Curse",
	[141] = "Pageant Boy",
	[142] = "Scapular",
	[143] = "Speed Ball",
	[144] = "Bum Friend",
	[145] = "Guppy's Head",
	[146] = "Prayer Card",
	[147] = "Notched Axe",
	[148] = "Infestation",
	[149] = "Ipecac",
	[150] = "Tough Love",
	[151] = "The Mulligan",
	[152] = "Technology 2",
	[153] = "Mutant Spider",
	[154] = "Chemical Peel",
	[155] = "The Peeper",
	[156] = "Habit",
	[157] = "Bloody Lust",
	[158] = "Crystal Ball",
	[159] = "Spirit of the Night",
	[160] = "Crack the Sky",
	[161] = "Ankh",
	[162] = "Celtic Cross",
	[163] = "Ghost Baby",
	[164] = "The Candle",
	[165] = "Cat-o-nine-tails",
	[166] = "D20",
	[167] = "Harlequin Baby",
	[168] = "Epic Fetus",
	[169] = "Polyphemus",
	[170] = "Daddy Longlegs",
	[171] = "Spider Butt",
	[172] = "Sacrificial Dagger",
	[173] = "Mitre",
	[174] = "Rainbow Baby",
	[175] = "Dad's Key",
	[176] = "Stem Cells",
	[177] = "Portable Slot",
	[178] = "Holy Water",
	[179] = "Fate",
	[180] = "The Black Bean",
	[181] = "White Pony",
	[182] = "Sacred Heart",
	[183] = "Tooth Picks",
	[184] = "Holy Grail",
	[185] = "Dead Dove",
	[186] = "Blood Rights",
	[187] = "Guppy's Hairball",
	[188] = "Abel",
	[189] = "SMB Super Fan",
	[190] = "Pyro",
	[191] = "3 Dollar Bill",
	[192] = "Telepathy For Dummies",
	[193] = "MEAT!",
	[194] = "Magic 8 Ball",
	[195] = "Mom's Coin Purse",
	[196] = "Squeezy",
	[197] = "Jesus Juice",
	[198] = "Box",
	[199] = "Mom's Key",
	[200] = "Mom's Eyeshadow",
	[201] = "Iron Bar",
	[202] = "Midas' Touch",
	[203] = "Humbleing Bundle",
	[204] = "Fanny Pack",
	[205] = "Sharp Plug",
	[206] = "Guillotine",
	[207] = "Ball of Bandages",
	[208] = "Champion Belt",
	[209] = "Butt Bombs",
	[210] = "Gnawed Leaf",
	[211] = "Spiderbaby",
	[212] = "Guppy's Collar",
	[213] = "Lost Contact",
	[214] = "Anemic",
	[215] = "Goat Head",
	[216] = "Ceremonial Robes",
	[217] = "Mom's Wig",
	[218] = "Placenta",
	[219] = "Old Bandage",
	[220] = "Sad Bombs",
	[221] = "Rubber Cement",
	[222] = "Anti-Gravity",
	[223] = "Pyromaniac",
	[224] = "Cricket's Body",
	[225] = "Gimpy",
	[226] = "Black Lotus",
	[227] = "Piggy Bank",
	[228] = "Mom's Perfume",
	[229] = "Monstro's Lung",
	[230] = "Abaddon",
	[231] = "Ball of Tar",
	[232] = "Stop Watch",
	[233] = "Tiny Planet",
	[234] = "Infestation 2",
	[236] = "E. Coli",
	[237] = "Death's Touch",
	[238] = "Key Piece 1",
	[239] = "Key Piece 2",
	[240] = "Experimental Treatment",
	[241] = "Contract from Below",
	[242] = "Infamy",
	[243] = "Trinity Shield",
	[244] = "Tech.5",
	[245] = "20/20",
	[246] = "Blue Map",
	[247] = "BFFS!",
	[248] = "Hive Mind",
	[249] = "There's Options",
	[250] = "BOGO Bombs",
	[251] = "Starter Deck",
	[252] = "Little Baggy",
	[253] = "Magic Scab",
	[254] = "Blood Clot",
	[255] = "Screw",
	[256] = "Hot Bombs",
	[257] = "Fire Mind",
	[258] = "Missing No.",
	[259] = "Dark Matter",
	[260] = "Black Candle",
	[261] = "Proptosis",
	[262] = "Missing Page 2",
	[263] = "Clear Rune",
	[264] = "Smart Fly",
	[265] = "Dry Baby",
	[266] = "Juicy Sack",
	[267] = "Robo-Baby 2.0",
	[268] = "Rotten Baby",
	[269] = "Headless Baby",
	[270] = "Leech",
	[271] = "Mystery Sack",
	[272] = "BBF",
	[273] = "Bob's Brain",
	[274] = "Best Bud",
	[275] = "Lil Brimstone",
	[276] = "Isaac's Heart",
	[277] = "Lil Haunt",
	[278] = "Dark Bum",
	[279] = "Big Fan",
	[280] = "Sissy Longlegs",
	[281] = "Punching Bag",
	[282] = "How to Jump",
	[283] = "D100",
	[284] = "D4",
	[285] = "D10",
	[286] = "Blank Card",
	[287] = "Book of Secrets",
	[288] = "Box of Spiders",
	[289] = "Red Candle",
	[290] = "The Jar",
	[291] = "Flush!",
	[292] = "Satanic Bible",
	[293] = "Head of Krampus",
	[294] = "Butter Bean",
	[295] = "Magic Fingers",
	[296] = "Converter",
	[297] = "Pandora's Box",
	[298] = "Unicorn Stump",
	[299] = "Taurus",
	[300] = "Aries",
	[301] = "Cancer",
	[302] = "Leo",
	[303] = "Virgo",
	[304] = "Libra",
	[305] = "Scorpio",
	[306] = "Sagittarius",
	[307] = "Capricorn",
	[308] = "Aquarius",
	[309] = "Pisces",
	[310] = "Eve's Mascara",
	[311] = "Judas' Shadow",
	[312] = "Maggy's Bow",
	[313] = "Holy Mantle",
	[314] = "Thunder Thighs",
	[315] = "Strange Attractor",
	[316] = "Cursed Eye",
	[317] = "Mysterious Liquid",
	[318] = "Gemini",
	[319] = "Cain's Other Eye",
	[320] = "???'s Only Friend",
	[321] = "Samson's Chains",
	[322] = "Mongo Baby",
	[323] = "Isaac's Tears",
	[324] = "Undefined",
	[325] = "Scissors",
	[326] = "Breath of Life",
	[327] = "The Polaroid",
	[328] = "The Negative",
	[329] = "The Ludovico Technique",
	[330] = "Soy Milk",
	[331] = "Godhead",
	[332] = "Lazarus' Rags",
	[333] = "The Mind",
	[334] = "The Body",
	[335] = "The Soul",
	[336] = "Dead Onion",
	[337] = "Broken Watch",
	[338] = "The Boomerang",
	[339] = "Safety Pin",
	[340] = "Caffeine Pill",
	[341] = "Torn Photo",
	[342] = "Blue Cap",
	[343] = "Latch Key",
	[344] = "Match Book",
	[345] = "Synthoil",
	[346] = "A Snack",
	[347] = "Diplopia",
	[348] = "Placebo",
	[349] = "Wooden Nickel",
	[350] = "Toxic Shock",
	[351] = "Mega Bean",
	[352] = "Glass Cannon",
	[353] = "Bomber Boy",
	[354] = "Crack Jacks",
	[355] = "Mom's Pearls",
	[356] = "Car Battery",
	[357] = "Box of Friends",
	[358] = "The Wiz",
	[359] = "8 Inch Nails",
	[360] = "Incubus",
	[361] = "Fate's Reward",
	[362] = "Lil Chest",
	[363] = "Sworn Protector",
	[364] = "Friend Zone",
	[365] = "Lost Fly",
	[366] = "Scatter Bombs",
	[367] = "Sticky Bombs",
	[368] = "Epiphora",
	[369] = "Continuum",
	[370] = "Mr. Dolly",
	[371] = "Curse of the Tower",
	[372] = "Charged Baby",
	[373] = "Dead Eye",
	[374] = "Holy Light",
	[375] = "Host Hat",
	[376] = "Restock",
	[377] = "Bursting Sack",
	[378] = "Number Two",
	[379] = "Pupula Duplex",
	[380] = "Pay To Play",
	[381] = "Eden's Blessing",
	[382] = "Friendly Ball",
	[383] = "Tear Detonator",
	[384] = "Lil Gurdy",
	[385] = "Bumbo",
	[386] = "D12",
	[387] = "Censer",
	[388] = "Key Bum",
	[389] = "Rune Bag",
	[390] = "Seraphim",
	[391] = "Betrayal",
	[392] = "Zodiac",
	[393] = "Serpent's Kiss",
	[394] = "Marked",
	[395] = "Tech X",
	[396] = "Ventricle Razor",
	[397] = "Tractor Beam",
	[398] = "God's Flesh",
	[399] = "Maw of the Void",
	[400] = "Spear of Destiny",
	[401] = "Explosivo",
	[402] = "Chaos",
	[403] = "Spider Mod",
	[404] = "Farting Baby",
	[405] = "GB Bug",
	[406] = "D8",
	[407] = "Purity",
	[408] = "Athame",
	[409] = "Empty Vessel",
	[410] = "Evil Eye",
	[411] = "Lusty Blood",
	[412] = "Cambion Conception",
	[413] = "Immaculate Conception",
	[414] = "More Options",
	[415] = "Crown of Light",
	[416] = "Deep Pockets",
	[417] = "Succubus",
	[418] = "Fruit Cake",
	[419] = "Teleport 2.0",
	[420] = "Black Powder",
	[421] = "Kidney Bean",
	[422] = "Glowing Hour Glass",
	[423] = "Circle of Protection",
	[424] = "Sack Head",
	[425] = "Night Light",
	[426] = "Obsessed Fan",
	[427] = "Mine Crafter",
	[428] = "PJs",
	[429] = "Head of the Keeper",
	[430] = "Papa Fly",
	[431] = "Multidimensional Baby",
	[432] = "Glitter Bombs",
	[433] = "My Shadow",
	[434] = "Jar of Flies",
	[435] = "Lil Loki",
	[436] = "Milk!",
	[437] = "D7",
	[438] = "Binky",
	[439] = "Mom's Box",
	[440] = "Kidney Stone",
	[441] = "Mega Blast",
	[442] = "Dark Prince's Crown",
	[443] = "Apple!",
	[444] = "Lead Pencil",
	[445] = "Dog Tooth",
	[446] = "Dead Tooth",
	[447] = "Linger Bean",
	[448] = "Shard of Glass",
	[449] = "Metal Plate",
	[450] = "Eye of Greed",
	[451] = "Tarot Cloth",
	[452] = "Varicose Veins",
	[453] = "Compound Fracture",
	[454] = "Polydactyly",
	[455] = "Dad's Lost Coin",
	[456] = "Midnight Snack",
	[457] = "Cone Head",
	[458] = "Belly Button",
	[459] = "Sinus Infection",
	[460] = "Glaucoma",
	[461] = "Parasitoid",
	[462] = "Eye of Belial",
	[463] = "Sulfuric Acid",
	[464] = "Glyph of Balance",
	[465] = "Analog Stick",
	[466] = "Contagion",
	[467] = "Finger!",
	[468] = "Shade",
	[469] = "Depression",
	[470] = "Hushy",
	[471] = "Lil Monstro",
	[472] = "King Baby",
	[473] = "Big Chubby",
	[474] = "Broken Glass Cannon",
	[475] = "Plan C",
	[476] = "D1",
	[477] = "Void",
	[478] = "Pause",
	[479] = "Smelter",
	[480] = "Compost",
	[481] = "Dataminer",
	[482] = "Clicker",
	[483] = "Mama Mega!",
	[484] = "Wait What?",
	[485] = "Crooked Penny",
	[486] = "Dull Razor",
	[487] = "Potato Peeler",
	[488] = "Metronome",
	[489] = "D infinity",
	[490] = "Eden's Soul",
	[491] = "Acid Baby",
	[492] = "YO LISTEN!",
	[493] = "Adrenaline",
	[494] = "Jacob's Ladder",
	[495] = "Ghost Pepper",
	[496] = "Euthanasia",
	[497] = "Camo Undies",
	[498] = "Duality",
	[499] = "Eucharist",
	[500] = "Sack of Sacks",
	[501] = "Greed's Gullet",
	[502] = "Large Zit",
	[503] = "Little Horn",
	[504] = "Brown Nugget",
	[505] = "Poke Go",
	[506] = "Backstabber",
	[507] = "Sharp Straw",
	[508] = "Mom's Razor",
	[509] = "Bloodshot Eye",
	[510] = "Delirious",
	[511] = "Angry Fly",
	[512] = "Black Hole",
	[513] = "Bozo",
	[514] = "Broken Modem",
	[515] = "Mystery Gift",
	[516] = "Sprinkler",
	[517] = "Fast Bombs",
	[518] = "Buddy in a Box",
	[519] = "Lil Delirium",
	[520] = "Jumper Cables",
	[521] = "Coupon",
	[522] = "Telekinesis",
	[523] = "Moving Box",
	[524] = "Technology Zero",
	[525] = "Leprosy",
	[526] = "7 Seals",
	[527] = "Mr. ME!",
	[528] = "Angelic Prism",
	[529] = "Pop!",
	[530] = "Death's List",
	[531] = "Haemolacria",
	[532] = "Lachryphagy",
	[533] = "Trisagion",
	[534] = "Schoolbag",
	[535] = "Blanket",
	[536] = "Sacrificial Altar",
	[537] = "Lil Spewer",
	[538] = "Marbles",
	[539] = "Mystery Egg",
	[540] = "Flat Stone",
	[541] = "Marrow",
	[542] = "Slipped Rib",
	[543] = "Hallowed Ground",
	[544] = "Pointy Rib",
	[545] = "Book of the Dead",
	[546] = "Dad's Ring",
	[547] = "Divorce Papers",
	[548] = "Jaw Bone",
	[549] = "Brittle Bones",
	[550] = "Broken Shovel",
	[551] = "Broken Shovel",
	[552] = "Mom's Shovel",
	[553] = "Mucormycosis",
	[554] = "2Spooky",
	[555] = "Golden Razor",
	[556] = "Sulfur",
	[557] = "Fortune Cookie",
	[558] = "Eye Sore",
	[559] = "120 Volt",
	[560] = "It Hurts",
	[561] = "Almond Milk",
	[562] = "Rock Bottom",
	[563] = "Nancy Bombs",
	[564] = "A Bar of Soap",
	[565] = "Blood Puppy",
	[566] = "Dream Catcher",
	[567] = "Paschal Candle",
	[568] = "Divine Intervention",
	[569] = "Blood Oath",
	[570] = "Playdough Cookie",
	[571] = "Orphan Socks",
	[572] = "Eye of the Occult",
	[573] = "Immaculate Heart",
	[574] = "Monstrance",
	[575] = "The Intruder",
	[576] = "Dirty Mind",
	[577] = "Damocles",
	[578] = "Free Lemonade",
	[579] = "Spirit Sword",
	[580] = "Red Key",
	[581] = "Psy Fly",
	[582] = "Wavy Cap",
	[583] = "Rocket in a Jar",
	[584] = "Book of Virtues",
	[585] = "Alabaster Box",
	[586] = "The Stairway",
	[588] = "Sol",
	[589] = "Luna",
	[590] = "Mercurius",
	[591] = "Venus",
	[592] = "Terra",
	[593] = "Mars",
	[594] = "Jupiter",
	[595] = "Saturnus",
	[596] = "Uranus",
	[597] = "Neptunus",
	[598] = "Pluto",
	[599] = "Voodoo Head",
	[600] = "Eye Drops",
	[601] = "Act of Contrition",
	[602] = "Member Card",
	[603] = "Battery Pack",
	[604] = "Mom's Bracelet",
	[605] = "The Scooper",
	[606] = "Ocular Rift",
	[607] = "Boiled Baby",
	[608] = "Freezer Baby",
	[609] = "Eternal D6",
	[610] = "Bird Cage",
	[611] = "Larynx",
	[612] = "Lost Soul",
	[614] = "Blood Bombs",
	[615] = "Lil Dumpy",
	[616] = "Bird's Eye",
	[617] = "Lodestone",
	[618] = "Rotten Tomato",
	[619] = "Birthright",
	[621] = "Red Stew",
	[622] = "Genesis",
	[623] = "Sharp Key",
	[624] = "Booster Pack",
	[625] = "Mega Mush",
	[626] = "Knife Piece 1",
	[627] = "Knife Piece 2",
	[628] = "Death Certificate",
	[629] = "Bot Fly",
	[631] = "Meat Cleaver",
	[632] = "Evil Charm",
	[633] = "Dogma",
	[634] = "Purgatory",
	[635] = "Stitches",
	[636] = "R Key",
	[637] = "Knockout Drops",
	[638] = "Eraser",
	[639] = "Yuck Heart",
	[640] = "Urn of Souls",
	[641] = "Akeldama",
	[642] = "Magic Skin",
	[643] = "Revelation",
	[644] = "Consolation Prize",
	[645] = "Tinytoma",
	[646] = "Brimstone Bombs",
	[647] = "4.5 Volt",
	[649] = "Fruity Plum",
	[650] = "Plum Flute",
	[651] = "Star of Bethlehem",
	[652] = "Cube Baby",
	[653] = "Vade Retro",
	[654] = "False PHD",
	[655] = "Spin to Win",
	[656] = "Damocles",
	[657] = "Vasculitis",
	[658] = "Giant Cell",
	[659] = "Tropicamide",
	[660] = "Card Reading",
	[661] = "Quints",
	[663] = "Tooth and Nail",
	[664] = "Binge Eater",
	[665] = "Guppy's Eye",
	[667] = "Strawman",
	[668] = "Dad's Note",
	[669] = "Sausage",
	[670] = "Options?",
	[671] = "Candy Heart",
	[672] = "A Pound of Flesh",
	[673] = "Redemption",
	[674] = "Spirit Shackles",
	[675] = "Cracked Orb",
	[676] = "Empty Heart",
	[677] = "Astral Projection",
	[678] = "C Section",
	[679] = "Lil Abaddon",
	[680] = "Montezuma's Revenge",
	[681] = "Lil Portal",
	[682] = "Worm Friend",
	[683] = "Bone Spurs",
	[684] = "Hungry Soul",
	[685] = "Jar of Wisps",
	[686] = "Soul Locket",
	[687] = "Friend Finder",
	[688] = "Inner Child",
	[689] = "Glitched Crown",
	[690] = "Belly Jelly",
	[691] = "Sacred Orb",
	[692] = "Sanguine Bond",
	[693] = "The Swarm",
	[694] = "Heartbreak",
	[695] = "Bloody Gust",
	[696] = "Salvation",
	[697] = "Vanishing Twin",
	[698] = "Twisted Pair",
	[699] = "Azazel's Rage",
	[700] = "Echo Chamber",
	[701] = "Isaac's Tomb",
	[702] = "Vengeful Spirit",
	[703] = "Esau Jr.",
	[704] = "Berserk!",
	[705] = "Dark Arts",
	[706] = "Abyss",
	[707] = "Supper",
	[708] = "Stapler",
	[709] = "Suplex!",
	[710] = "Bag of Crafting",
	[711] = "Flip",
	[712] = "Lemegeton",
	[713] = "Sumptorium",
	[714] = "Recall",
	[715] = "Hold",
	[716] = "Keeper's Sack",
	[717] = "Keeper's Kin",
	[719] = "Keeper's Box",
	[720] = "Everything Jar",
	[721] = "TMTRAINER",
	[722] = "Anima Sola",
	[723] = "Spindown Dice",
	[724] = "Hypercoagulation",
	[725] = "IBS",
	[726] = "Hemoptysis",
	[727] = "Ghost Bombs",
	[728] = "Gello",
	[729] = "Decap Attack",
	[730] = "Glass Eye",
	[731] = "Stye",
	[732] = "Mom's Ring",
}

nameMap.Familiars = {
	[1] = "Brother Bobby",
	[2] = "Demon Baby",
	[3] = "Lil Chubby",
	[4] = "Lil Gish",
	[5] = "Lil Steven",
	[6] = "Robo Baby",
	[7] = "Sister Maggy",
	[8] = "Abel",
	[9] = "Ghost Baby",
	[10] = "Harlequin Baby",
	[11] = "Rainbow Baby",
	[12] = "Isaac's Head",
	[13] = "???'s Soul",
	[14] = "Dead Bird",
	[15] = "Eve's Bird Foot",
	[16] = "Daddy Longlegs",
	[17] = "Peeper",
	[18] = "Bomb Bag",
	[19] = "Sack of Pennies",
	[22] = "Little C.H.A.D",
	[23] = "The Relic",
	[24] = "Bum Friend",
	[25] = "Holy Water",
	[26] = "Key Piece 1",
	[27] = "Key Piece 2",
	[28] = "Full Key",
	[30] = "Forever Alone",
	[31] = "Distant Admiration",
	[32] = "Guardian Angel",
	[33] = "Pretty Fly",
	[35] = "Sacrificial Dagger",
	[40] = "Dead Cat",
	[41] = "1up!",
	[42] = "Guppy's Hairball",
	[43] = "Blue Fly",
	[44] = "Cube of Meat Lv.1",
	[45] = "Cube of Meat Lv.2",
	[46] = "Cube of Meat Lv.3",
	[47] = "Cube of Meat Lv.4",
	[48] = "Isaac's Body",
	[50] = "Smart Fly",
	[51] = "Dry Baby",
	[52] = "Juicy Sack",
	[53] = "Robo Baby 2.0",
	[54] = "Rotten Baby",
	[55] = "Headless Baby",
	[56] = "Leech",
	[57] = "Mystery Sack",
	[58] = "BFF",
	[59] = "Bob's Brain",
	[60] = "Best Bud",
	[61] = "Lil Brimstone",
	[62] = "Isaac's Heart",
	[63] = "Lil Haunt",
	[64] = "Dark Bum",
	[65] = "Big Fan",
	[66] = "Sissy Longlegs",
	[67] = "Punching Bag",
	[68] = "Guillotine Head",
	[69] = "Ball of Bandages Lv.1",
	[70] = "Ball of Bandages Lv.2",
	[71] = "Ball of Bandages Lv.3",
	[72] = "Ball of Bandages Lv.4",
	[73] = "Blue Spider",
	[74] = "Mongo Baby",
	[75] = "Samson's Chains",
	[76] = "Cain's Other Eye",
	[77] = "???'s Only Friend",
	[78] = "Scissors Head",
	[79] = "Gemini",
	[80] = "Incubus",
	[81] = "Fate's Reward",
	[82] = "Lil Chest",
	[83] = "Sword Protector",
	[84] = "Friend Zone",
	[85] = "Lost Fly",
	[86] = "Charged Baby",
	[87] = "Lil Gurdy",
	[88] = "Bumbo",
	[89] = "Censor",
	[90] = "Key Bum",
	[91] = "Rune Bag",
	[92] = "Seraphim",
	[93] = "GB Bug",
	[94] = "Spider Mod",
	[95] = "Farting Baby",
	[96] = "Succubus",
	[97] = "Lil Loki",
	[98] = "Obsessed Fan",
	[99] = "Papa Fly",
	[100] = "Milk!",
	[101] = "Multidimensional Baby",
	[102] = "Super Bum",
	[103] = "Tonsil",
	[104] = "Big Chubby",
	[105] = "Depression",
	[106] = "Shade",
	[107] = "Hushy",
	[108] = "Lil Monstro",
	[109] = "King Baby",
	[110] = "Finger!",
	[111] = "YO LISTEN!",
	[112] = "Acid Baby",
	[113] = "Spider Baby",
	[114] = "Sack of Sacks",
	[115] = "Brown Nugget Pooter",
	[116] = "Bloodshot Eye",
	[117] = "Mom's Razor",
	[118] = "Angry Fly",
	[119] = "Buddy in a Box",
	[120] = "Sprinkler",
	[121] = "Leprosy",
	[122] = "Lil Harbingers",
	[123] = "Angelic Prism",
	[124] = "Mystery Egg",
	[125] = "Lil Spewer",
	[126] = "Slipped Rib",
	[127] = "Pointy Rib",
	[128] = "Bone Orbital",
	[129] = "Hallowed Ground",
	[130] = "Jaw Bone",
	[200] = "Intruder",
	[201] = "Dip",
	[202] = "Damocles",
	[203] = "Blood Oath",
	[204] = "Psy Fly",
	[205] = "Menorah",
	[206] = "Wisp",
	[207] = "Scooper",
	[208] = "Boiled Baby",
	[209] = "Freezer Baby",
	[210] = "Bird Cage",
	[211] = "Lost Soul",
	[212] = "Lil Dumpy",
	[213] = "Knife Piece 1",
	[214] = "Knife Piece 2",
	[216] = "Tinytoma",
	[217] = "Small Tinytoma",
	[218] = "Bot Fly",
	[220] = "Siren Minion",
	[221] = "Paschal Candle",
	[222] = "Stitches",
	[223] = "Full Knife",
	[224] = "Plum Flute",
	[225] = "Fruity Plum",
	[226] = "Spin to Win",
	[228] = "Minisaac",
	[229] = "The Swarm",
	[230] = "Lil Abaddon",
	[231] = "Abyss Locust",
	[232] = "Lil Portal",
	[233] = "Worm Friend",
	[234] = "Bone Spur",
	[235] = "Twisted Pair",
	[236] = "Star of Bethlehem",
	[237] = "Item Wisp",
	[238] = "Clot",
	[239] = "Cube Baby",
	[240] = "Gello",
	[241] = "Blood Puppy",
	[242] = "Vanishing Twin",
	[243] = "Decap Attack",
	[900] = "The Forgotten's Body",
}

nameMap.Knives = {
	[0] = "Mom's Knife",
	[1] = "Bone",
	[2] = "Bone w/ Knife",
	[3] = "Jawbone",
	[4] = "Bag of Crafting",
	[5] = "Sumptorium",
	[9] = "Notched Axe",
	[10] = "Spirit Sword",
	[11] = "Tech Sword",
}

nameMap.NormalCharacters = {
	[PlayerType.PLAYER_ISAAC] = "Isaac",
	[PlayerType.PLAYER_MAGDALENE] = "Magdalene",
	[PlayerType.PLAYER_CAIN] = "Cain",
	[PlayerType.PLAYER_JUDAS] = "Judas",
	[PlayerType.PLAYER_BLUEBABY] = "???",
	[PlayerType.PLAYER_EVE] = "Eve",
	[PlayerType.PLAYER_SAMSON] = "Samson",
	[PlayerType.PLAYER_AZAZEL] = "Azazel",
	[PlayerType.PLAYER_LAZARUS] = "Lazarus",
	[PlayerType.PLAYER_EDEN] = "Eden",
	[PlayerType.PLAYER_THELOST] = "The Lost",
	[PlayerType.PLAYER_LAZARUS2] = "Lazarus 2",
	[PlayerType.PLAYER_BLACKJUDAS] = "Black Judas",
	[PlayerType.PLAYER_LILITH] = "Lilith",
	[PlayerType.PLAYER_KEEPER] = "Keeper",
	[PlayerType.PLAYER_APOLLYON] = "Apollyon",
	[PlayerType.PLAYER_THEFORGOTTEN] = "The Forgotten",
	[PlayerType.PLAYER_THESOUL] = "The Soul",
	[PlayerType.PLAYER_BETHANY] = "Bethany",
	[PlayerType.PLAYER_JACOB] = "Jacob",
	[PlayerType.PLAYER_ESAU] = "Esau"
}

nameMap.TaintedCharacters = {
	[PlayerType.PLAYER_ISAAC_B] = "Isaac",
	[PlayerType.PLAYER_MAGDALENE_B] = "Magdalene",
	[PlayerType.PLAYER_CAIN_B] = "Cain",
	[PlayerType.PLAYER_JUDAS_B] = "Judas",
	[PlayerType.PLAYER_BLUEBABY_B] = "???",
	[PlayerType.PLAYER_EVE_B] = "Eve",
	[PlayerType.PLAYER_SAMSON_B] = "Samson",
	[PlayerType.PLAYER_AZAZEL_B] = "Azazel",
	[PlayerType.PLAYER_LAZARUS_B] = "Lazarus",
	[PlayerType.PLAYER_EDEN_B] = "Eden",
	[PlayerType.PLAYER_THELOST_B] = "The Lost",
	[PlayerType.PLAYER_LILITH_B] = "Lilith",
	[PlayerType.PLAYER_KEEPER_B] = "Keeper",
	[PlayerType.PLAYER_APOLLYON_B] = "Apollyon",
	[PlayerType.PLAYER_THEFORGOTTEN_B] = "The Forgotten",
	[PlayerType.PLAYER_BETHANY_B] = "Bethany",
	[PlayerType.PLAYER_JACOB_B] = "Jacob",
	[PlayerType.PLAYER_LAZARUS2_B] = "Lazarus 2",
	[PlayerType.PLAYER_JACOB2_B] = "Jacob 2",
	[PlayerType.PLAYER_THESOUL_B] = "The Soul",
}

return nameMap
