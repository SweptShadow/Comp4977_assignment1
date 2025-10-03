/**
 @Author: Dalraj Bains
 @Author: Yujin Jeong
 @Author: Brian Diep
 */
import Foundation
internal import Combine

class ZodiacViewModel: ObservableObject {
    
    @Published var zodiacSigns: [ZodiacSign] = [
        
        ZodiacSign(
            name: "Rat",
            emoji: "🐭",
            imageName: "rat",
            description: "People born in the Year of the Rat are recognized for their charm and attraction to the opposite sex. They work hard to achieve their goals, acquire possessions and are likely to be perfectionists. They are thrifty with money, easily angered, and love to gossip. They have big ambitions and are usually very successful.",
            traits: "Charming, hardworking, perfectionist, thrifty, ambitious",
            compatibility: "Dragon, Monkey, and Ox",
            years: [1912, 1924, 1936, 1948, 1960, 1972, 1984, 1996, 2008, 2020, 2032]
        ),
        ZodiacSign(
            name: "Ox",
            emoji: "🐂",
            imageName: "ox",
            description: "People born in the Year of the Ox are patient, speak little, and inspire confidence in others. They tend to be eccentric and bigoted, angering easily. They have fierce tempers, and although they speak little, they are quite eloquent when they do. Generally easy-going, they can also be remarkably stubborn, hating failure opposition. Oxes are mentally and physically alert.",
            traits: "Patient, confident, eloquent, stubborn, mentally alert",
            compatibility: "Snakes, Roosters, and Rats",
            years: [1913, 1925, 1937, 1949, 1961, 1973, 1985, 1997, 2009, 2021, 2033]
        ),
        ZodiacSign(
            name: "Tiger",
            emoji: "🐅",
            imageName: "tiger",
            description: "Tiger people are sensitive, given to deep thinking, and capable of great sympathy, however, they can be extremely short-tempered. Other people respect them greatly but sometimes conflict with older people or those in authority. Tigers can sometimes not make up their minds, resulting in poor, hasty decisions or sound decisions arrived at too late. They are suspicious of others, but they are courageous and powerful.",
            traits: "Sensitive, sympathetic, courageous, powerful, short-tempered",
            compatibility: "Horses, Dragons, and Dogs",
            years: [1914, 1926, 1938, 1950, 1962, 1974, 1986, 1998, 2010, 2022, 2034]
        ),
        ZodiacSign(
            name: "Rabbit",
            emoji: "🐰",
            imageName: "rabbit",
            description: "People born in the Year of the Rabbit are articulate, talented, and ambitious. They are virtuous, reserved, and have excellent taste. They are admired, trusted, and are often financially lucky. They are fond of gossip but are tactful and generally kind, seldom losing their temper. They are clever at business and conscientious, never backing out of a contract. They would make good gamblers, for they have the uncanny gift of choosing the right thing. However, they seldom gamble, as they are conservative and wise.",
            traits: "Articulate, talented, virtuous, tactful, conservative",
            compatibility: "Sheep, Pig, and Dog",
            years: [1915, 1927, 1939, 1951, 1963, 1975, 1987, 1999, 2011, 2023, 2035]
        ),
        ZodiacSign(
            name: "Dragon",
            emoji: "🐉",
            imageName: "dragon",
            description: "People born in the Year of the Dragon are healthy, energetic, excitable, short-tempered, and stubborn. They are also honest, sensitive, and brave, inspiring confidence and trust. They are the most eccentric of any in the eastern zodiac. They neither borrow money nor make flowery speeches, but they tend to be soft-hearted, sometimes giving others an advantage over them.",
            traits: "Energetic, honest, brave, eccentric, soft-hearted",
            compatibility: "Rats, Snakes, Monkeys, and Roosters",
            years: [1916, 1928, 1940, 1952, 1964, 1976, 1988, 2000, 2012, 2024, 2036]
        ),
        ZodiacSign(
            name: "Snake",
            emoji: "🐍",
            imageName: "snake",
            description: "People born in the Year of the Snake are deep, saying little and possessing great wisdom. They are financially fortunate, never having to worry about money. They are often quite vain, selfish, and stingy, yet they have tremendous sympathy for others and try to help those less fortunate. Snake people tend to overdo it since they doubt other people's judgment and prefer to rely on themselves. They are determined in whatever they do and hate to fail. Although they're calm on the surface, they are intense and passionate.",
            traits: "Wise, financially fortunate, determined, intense, passionate",
            compatibility: "Ox and Rooster",
            years: [1917, 1929, 1941, 1953, 1965, 1977, 1989, 2001, 2013, 2025, 2037]
        ),
        ZodiacSign(
            name: "Horse",
            emoji: "🐴",
            imageName: "horse",
            description: "People born in the Year of the Horse are popular. They are cheerful, skillful with money, and perceptive, although they sometimes talk too much. They are wise, talented, good with their hands, and sometimes have a weakness for members of the opposite sex. They are impatient and hot-blooded about everything except their daily work. They like entertainment and large crowds. They are very independent and rarely listen to advice.",
            traits: "Popular, cheerful, perceptive, independent, impatient",
            compatibility: "Tigers, Dogs, and Sheep",
            years: [1918, 1930, 1942, 1954, 1966, 1978, 1990, 2002, 2014, 2026, 2038]
        ),
        ZodiacSign(
            name: "Sheep",
            emoji: "🐑",
            imageName: "sheep",
            description: "People born in the Year of Ram are elegant and highly accomplished in the arts. They seem to be, at first glance, better off than those born in the zodiac's other years, but they are also often shy, pessimistic, and puzzled about life. They are usually deeply religious yet timid by nature. Sometimes clumsy in speech, they are always passionate about what they do and what they believe in. They never have to worry about having the best in life, as their abilities make money for them, and they can enjoy the creature comforts they enjoy. Wise, gentle, and compassionate.",
            traits: "Elegant, artistic, gentle, compassionate, shy",
            compatibility: "Rabbits, Pigs, and Horses",
            years: [1919, 1931, 1943, 1955, 1967, 1979, 1991, 2003, 2015, 2027, 2039]
        ),
        ZodiacSign(
            name: "Monkey",
            emoji: "🐵",
            imageName: "monkey",
            description: "People born in the Year of the Monkey are the erratic geniuses of the cycle. They are remarkably inventive, clever, skillful, flexible, and original, easily solving the most difficult problems. There are few fields in which they wouldn't be successful, but they have a habit of being too agreeable. They want to do things now, and if they cannot get started immediately, they become discouraged and sometimes leave their projects. Although good at making decisions, they tend to look down on others. Having common sense, they have a deep desire for knowledge and have excellent memories. They are strong-willed, but their anger cools quickly.",
            traits: "Inventive, clever, flexible, original, strong-willed",
            compatibility: "Dragon and Rat",
            years: [1920, 1932, 1944, 1956, 1968, 1980, 1992, 2004, 2016, 2028, 2040]
        ),
        ZodiacSign(
            name: "Rooster",
            emoji: "🐓",
            imageName: "rooster",
            description: "People born in the Year of the Rooster are deep thinkers, capable, and talented. They like to be busy and are devoted beyond their capabilities, deeply disappointed if they fail. People born in the Year of the Rooster are often quite eccentric and often have rather difficult relationships with others. They always think they are right and usually are! They frequently are loners, and though they give the outward impression of being adventurous, they are timid. Rooster people's emotions are like their fortunes, swinging from very high to very low. They can be selfish and too outspoken but are always interesting. They can also be extremely brave.",
            traits: "Deep thinker, capable, eccentric, brave, outspoken",
            compatibility: "Ox, Snake, and Dragon",
            years: [1921, 1933, 1945, 1957, 1969, 1981, 1993, 2005, 2017, 2029, 2041]
        ),
        ZodiacSign(
            name: "Dog",
            emoji: "🐕",
            imageName: "dog",
            description: "People born in the Year of the Dog possess the best traits of human nature. They have a deep sense of loyalty, are honest, and inspire other people´s confidence because they know how to keep secrets. But the Dog is somewhat selfish, terribly stubborn, and eccentric. They care little for wealth, yet somehow always seem to have money. They can be cold emotionally and sometimes distant at parties. They can find fault with many things and are noted for their sharp tongues. People born in the Year of the Dog make good leaders.",
            traits: "Loyal, honest, stubborn, good leader, sharp-tongued",
            compatibility: "Horse, Tiger, and Rabbit",
            years: [1922, 1934, 1946, 1958, 1970, 1982, 1994, 2006, 2018, 2030, 2042]
        ),
        ZodiacSign(
            name: "Pig",
            emoji: "🐷",
            imageName: "pig",
            description: "People born in the Year of the Pig are studious and gallant with tremendous inner strength. They are often quiet but always well-informed, choosing few friends and loyal for life. The Pig will never retreat from its goals and its intuitions will pay off handsomely if followed, boding well in fortune and luck for the rest of the year.",
            traits: "Studious, gallant, loyal, strong-willed, intuitive",
            compatibility: "Rabbits and Sheep",
            years: [1923, 1935, 1947, 1959, 1971, 1983, 1995, 2007, 2019, 2031, 2043]
        )
    ]
    
    func calculateZodiacSign(for year: Int) -> ZodiacSign {
        
        let baseYear = 1912 // Year of the Rat
        let cycle = (year - baseYear) % 12
        let adjustedIndex = cycle < 0 ? cycle + 12 : cycle
        return zodiacSigns[adjustedIndex]
    }
}
