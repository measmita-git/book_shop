import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:collection/collection.dart'; // Import for ListEquality
import 'cart_item.dart';
import 'book.dart'; // Make sure this import path is correct

class Restaurant extends ChangeNotifier {
  // List of book
  final List<Book> _menu = [
    // Fiction
    Book(
      name: "To Kill a Mockingbird",
      description: "Harper Lee’s classic novel exploring themes of racial injustice and moral growth.",
      imagePath: "assets/to_kill_a_mockingbird.jpeg",
      price: 9.99,
      category: BookCategory.fiction,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 7.49),
        Addon(name: "Discussion Guide", price: 3.49),
        Addon(name: "Literary Analysis Poster", price: 5.49),
      ],
    ),

    Book(
      name: "1984",
      description: "George Orwell’s dystopian novel about totalitarianism and surveillance.",
      imagePath: "assets/1984.jpeg",
      price: 10.49,
      category: BookCategory.fiction,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 8.49),
        Addon(name: "Discussion Guide", price: 3.99),
        Addon(name: "Dystopian World Map", price: 5.49),
      ],
    ),

    Book(
      name: "Pride and Prejudice",
      description: "Jane Austen’s novel about manners, marriage, and morality in 19th century England.",
      imagePath: "assets/pride_prejudice.jpeg",
      price: 8.99,
      category: BookCategory.fiction,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 6.99),
        Addon(name: "Discussion Guide", price: 3.49),
        Addon(name: "Regency Era Poster", price: 4.99),
      ],
    ),

    Book(
      name: "The Great Gatsby",
      description: "F. Scott Fitzgerald’s novel set in the Jazz Age, exploring themes of wealth and illusion.",
      imagePath: "assets/great_gatsby.jpeg",
      price: 9.49,
      category: BookCategory.fiction,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 7.49),
        Addon(name: "Discussion Guide", price: 3.49),
        Addon(name: "Jazz Age Poster", price: 5.49),
      ],
    ),

    Book(
      name: "The Catcher in the Rye",
      description: "J.D. Salinger’s novel about adolescent alienation and loss of innocence.",
      imagePath: "assets/catcher_in_rye.jpeg",
      price: 10.99,
      category: BookCategory.fiction,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 8.49),
        Addon(name: "Discussion Guide", price: 4.49),
        Addon(name: "Adolescent Issues Poster", price: 5.99),
      ],
    ),

    Book(
      name: "Brave New World",
      description: "Aldous Huxley’s dystopian novel about a future society driven by technology and consumerism.",
      imagePath: "assets/brave_new_world.jpeg",
      price: 11.49,
      category: BookCategory.fiction,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 9.49),
        Addon(name: "Discussion Guide", price: 4.49),
        Addon(name: "Dystopian World Map", price: 6.49),
      ],
    ),

    Book(
      name: "The Hobbit",
      description: "J.R.R. Tolkien’s fantasy novel about Bilbo Baggins’s adventure in Middle-earth.",
      imagePath: "assets/hobbit.jpeg",
      price: 12.99,
      category: BookCategory.fiction,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 9.49),
        Addon(name: "Discussion Guide", price: 4.49),
        Addon(name: "Middle-earth Map", price: 6.99),
      ],
    ),

    Book(
      name: "Harry Potter and the Sorcerer's Stone",
      description: "J.K. Rowling’s magical tale of a young wizard’s first year at Hogwarts School of Witchcraft and Wizardry.",
      imagePath: "assets/harry_potter.jpeg",
      price: 13.99,
      category: BookCategory.fiction,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 10.49),
        Addon(name: "Discussion Guide", price: 5.49),
        Addon(name: "Hogwarts Map", price: 7.99),
      ],
    ),

    Book(
      name: "The Da Vinci Code",
      description: "Dan Brown’s thriller involving art, history, and religious conspiracies.",
      imagePath: "assets/da_vinci_code.jpeg",
      price: 11.99,
      category: BookCategory.fiction,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 8.99),
        Addon(name: "Discussion Guide", price: 4.49),
        Addon(name: "Mystery Puzzle", price: 6.49),
      ],
    ),

    Book(
      name: "The Shining",
      description: "Stephen King’s horror novel about a family staying in an isolated hotel with a dark history.",
      imagePath: "assets/shining.jpeg",
      price: 10.49,
      category: BookCategory.fiction,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 7.49),
        Addon(name: "Discussion Guide", price: 3.99),
        Addon(name: "Horror Poster", price: 5.99),
      ],
    ),

    Book(
      name: "Gone with the Wind",
      description: "Margaret Mitchell’s epic novel set during the American Civil War and Reconstruction era.",
      imagePath: "assets/gone_with_wind.jpeg",
      price: 14.49,
      category: BookCategory.fiction,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 10.49),
        Addon(name: "Discussion Guide", price: 5.49),
        Addon(name: "Civil War Poster", price: 6.99),
      ],
    ),

    Book(
      name: "Little Women",
      description: "Louisa May Alcott’s classic novel about the lives and loves of the four March sisters.",
      imagePath: "assets/little_women.jpeg",
      price: 9.49,
      category: BookCategory.fiction,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 7.49),
        Addon(name: "Discussion Guide", price: 3.49),
        Addon(name: "Historical Poster", price: 4.99),
      ],
    ),

    Book(
      name: "Murder on the Orient Express",
      description: "Agatha Christie’s classic murder mystery featuring detective Hercule Poirot.",
      imagePath: "assets/murder_orient_express.jpeg",
      price: 10.99,
      category: BookCategory.fiction,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 8.49),
        Addon(name: "Discussion Guide", price: 4.49),
        Addon(name: "Mystery Map", price: 5.99),
      ],
    ),

    Book(
      name: "The Girl with the Dragon Tattoo",
      description: "Stieg Larsson’s thriller about a journalist and a hacker investigating a disappearance.",
      imagePath: "assets/girl_dragon_tattoo.jpeg",
      price: 11.49,
      category: BookCategory.fiction,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 9.49),
        Addon(name: "Discussion Guide", price: 4.49),
        Addon(name: "Thriller Poster", price: 6.49),
      ],
    ),

    Book(
      name: "The Alchemist",
      description: "Paulo Coelho’s novel about a shepherd’s journey to find his personal legend.",
      imagePath: "assets/alchemist.jpeg",
      price: 9.99,
      category: BookCategory.fiction,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 7.49),
        Addon(name: "Discussion Guide", price: 3.49),
        Addon(name: "Inspirational Poster", price: 5.49),
      ],
    ),

    Book(
      name: "Life of Pi",
      description: "Yann Martel’s tale of a boy stranded on a lifeboat with a Bengal tiger.",
      imagePath: "assets/life_of_pi.jpeg",
      price: 10.49,
      category: BookCategory.fiction,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 8.49),
        Addon(name: "Discussion Guide", price: 4.49),
        Addon(name: "Adventure Poster", price: 6.49),
      ],
    ),

    Book(
      name: "The Catcher in the Rye",
      description: "J.D. Salinger’s novel about a teenager’s experiences in New York City.",
      imagePath: "assets/catcher_rye.jpeg",
      price: 11.99,
      category: BookCategory.fiction,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 9.49),
        Addon(name: "Discussion Guide", price: 4.49),
        Addon(name: "New York City Poster", price: 5.99),
      ],
    ),

    Book(
      name: "The Hunger Games",
      description: "Suzanne Collins’ dystopian novel about a televised fight to the death.",
      imagePath: "assets/hunger_games.jpeg",
      price: 12.49,
      category: BookCategory.fiction,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 10.49),
        Addon(name: "Discussion Guide", price: 5.49),
        Addon(name: "Dystopian Map", price: 6.49),
      ],
    ),

    Book(
      name: "Gone Girl",
      description: "Gillian Flynn’s thriller about a woman's disappearance and its impact on her husband.",
      imagePath: "assets/gone_girl.jpeg",
      price: 11.49,
      category: BookCategory.fiction,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 8.49),
        Addon(name: "Discussion Guide", price: 4.49),
        Addon(name: "Thriller Poster", price: 6.49),
      ],
    ),

    Book(
      name: "The Road",
      description: "Cormac McCarthy’s post-apocalyptic novel about a father and son’s journey across a desolate landscape.",
      imagePath: "assets/road.jpeg",
      price: 12.99,
      category: BookCategory.fiction,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 9.49),
        Addon(name: "Discussion Guide", price: 4.49),
        Addon(name: "Post-Apocalyptic Poster", price: 6.99),
      ],
    ),

    Book(
      name: "The Secret Life of Bees",
      description: "Sue Monk Kidd’s novel about a young girl’s journey to find her mother and uncover her own identity.",
      imagePath: "assets/secret_life_bees.jpeg",
      price: 10.99,
      category: BookCategory.fiction,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 8.49),
        Addon(name: "Discussion Guide", price: 4.49),
        Addon(name: "Bee Poster", price: 5.99),
      ],
    ),

    Book(
      name: "The Kite Runner",
      description: "Khaled Hosseini’s novel about a young boy’s experiences in Afghanistan and his search for redemption.",
      imagePath: "assets/kite_runner.jpeg",
      price: 11.99,
      category: BookCategory.fiction,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 9.49),
        Addon(name: "Discussion Guide", price: 4.49),
        Addon(name: "Afghanistan Poster", price: 6.49),
      ],
    ),

    Book(
      name: "The Martian",
      description: "Andy Weir’s science fiction novel about an astronaut stranded on Mars and his struggle for survival.",
      imagePath: "assets/martian.jpeg",
      price: 12.99,
      category: BookCategory.fiction,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 10.49),
        Addon(name: "Discussion Guide", price: 5.49),
        Addon(name: "Mars Map", price: 7.99),
      ],
    ),

    Book(
      name: "Dune",
      description: "Frank Herbert’s epic science fiction novel set in a distant future amidst a huge interstellar empire.",
      imagePath: "assets/dune.jpeg",
      price: 13.49,
      category: BookCategory.fiction,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 11.49),
        Addon(name: "Discussion Guide", price: 5.49),
        Addon(name: "Desert Planet Map", price: 7.99),
      ],
    ),



    // Romance
    Book(
      name: "Pride and Prejudice",
      description: "A classic novel by Jane Austen exploring the manners and marriage of early 19th-century England.",
      imagePath: "assets/pride_and_prejudice.jpeg",
      price: 8.99,
      category: BookCategory.romance,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 1.99),
        Addon(name: "Decorative Slipcase", price: 4.99),
        Addon(name: "Author’s Special Edition", price: 9.99),
        Addon(name: "Study Guide", price: 2.49),
      ],
    ),

    Book(
      name: "The Notebook",
      description: "Nicholas Sparks' poignant story of enduring love and the memories that keep it alive.",
      imagePath: "assets/the_notebook.jpeg",
      price: 7.99,
      category: BookCategory.romance,
      availableAddons: [
        Addon(name: "Signed Copy", price: 5.99),
        Addon(name: "Personalized Dedication", price: 3.99),
        Addon(name: "Gift Wrapping", price: 2.49),
        Addon(name: "Matching Book Light", price: 4.99),
      ],
    ),

    Book(
      name: "Outlander",
      description: "Diana Gabaldon's tale of time-traveling romance and adventure set in 18th-century Scotland.",
      imagePath: "assets/outlander.jpeg",
      price: 10.99,
      category: BookCategory.romance,
      availableAddons: [
        Addon(name: "Custom Cover", price: 3.99),
        Addon(name: "Map of Scotland", price: 2.99),
        Addon(name: "Author Interview Compilation", price: 4.99),
        Addon(name: "Historical Context Guide", price: 2.49),
      ],
    ),

    Book(
      name: "Me Before You",
      description: "Jojo Moyes' emotional journey of love, life, and letting go.",
      imagePath: "assets/me_before_you.jpeg",
      price: 6.99,
      category: BookCategory.romance,
      availableAddons: [
        Addon(name: "Personal Bookplate", price: 2.49),
        Addon(name: "Signed Edition", price: 5.99),
        Addon(name: "Book-to-Movie Adaptation DVD", price: 7.99),
        Addon(name: "Companion Recipe Book", price: 3.99),
      ],
    ),

    Book(
      name: "Brida",
      description: "Paulo Coelho’s magical tale of a young woman's quest for self-discovery and true love.",
      imagePath: "assets/brida.jpeg",
      price: 9.49,
      category: BookCategory.romance,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 1.99),
        Addon(name: "Inspirational Quote Cards", price: 3.49),
        Addon(name: "Author's Other Works Discount", price: 5.99),
        Addon(name: "Personal Dedication", price: 2.99),
      ],
    ),

    Book(
      name: "The Kiss Quotient",
      description: "Helen Hoang’s delightful story of a woman with Asperger’s seeking a romantic relationship.",
      imagePath: "assets/the_kiss_quotient.jpeg",
      price: 8.49,
      category: BookCategory.romance,
      availableAddons: [
        Addon(name: "Magnetic Bookmark", price: 2.49),
        Addon(name: "Special Edition Cover", price: 4.99),
        Addon(name: "Companion Workbook", price: 5.99),
        Addon(name: "Author's Q&A Booklet", price: 3.49),
      ],
    ),

    Book(
      name: "Red, White & Royal Blue",
      description: "Casey McQuiston's modern romance between a First Son and a British Prince.",
      imagePath: "assets/red_white_royal_blue.jpeg",
      price: 9.99,
      category: BookCategory.romance,
      availableAddons: [
        Addon(name: "Custom Cover", price: 3.99),
        Addon(name: "Limited Edition Postcards", price: 2.99),
        Addon(name: "Signed Bookplate", price: 4.99),
        Addon(name: "Movie Adaptation Bookmark", price: 1.49),
      ],
    ),

    Book(
      name: "The Rosie Project",
      description: "Graeme Simsion's humorous and heartwarming tale of a geneticist seeking love.",
      imagePath: "assets/the_rosie_project.jpeg",
      price: 7.49,
      category: BookCategory.romance,
      availableAddons: [
        Addon(name: "Personal Annotations", price: 2.99),
        Addon(name: "Custom Bookmarks", price: 1.99),
        Addon(name: "Reading Light", price: 4.99),
        Addon(name: "Matching Notebook", price: 3.49),
      ],
    ),

    Book(
      name: "To All the Boys I've Loved Before",
      description: "Jenny Han’s charming story of a teenage girl's secret love letters.",
      imagePath: "assets/to_all_the_boys.jpeg",
      price: 6.49,
      category: BookCategory.romance,
      availableAddons: [
        Addon(name: "Gift Wrapping", price: 2.49),
        Addon(name: "Custom Bookmark", price: 1.99),
        Addon(name: "Author Interview DVD", price: 5.99),
        Addon(name: "Book-themed Tote Bag", price: 6.99),
      ],
    ),

    Book(
      name: "The Wedding Date",
      description: "Jasmine Guillory’s tale of an unexpected romance beginning with a fake date.",
      imagePath: "assets/the_wedding_date.jpeg",
      price: 8.99,
      category: BookCategory.romance,
      availableAddons: [
        Addon(name: "Signed Copy", price: 5.99),
        Addon(name: "Gift Wrapping", price: 2.49),
        Addon(name: "Romance-themed Bookmark", price: 1.49),
        Addon(name: "Exclusive Short Story", price: 3.99),
      ],
    ),

    Book(
      name: "Beautiful Disaster",
      description: "Jamie McGuire’s story of a college romance with a bad boy.",
      imagePath: "assets/beautiful_disaster.jpeg",
      price: 7.99,
      category: BookCategory.romance,
      availableAddons: [
        Addon(name: "Custom Cover", price: 3.99),
        Addon(name: "Signed Bookplate", price: 4.99),
        Addon(name: "Companion Journal", price: 5.99),
        Addon(name: "Author’s Note Compilation", price: 2.49),
      ],
    ),

    Book(
      name: "The Hating Game",
      description: "Sally Thorne’s witty and romantic battle between two office colleagues.",
      imagePath: "assets/the_hating_game.jpeg",
      price: 8.49,
      category: BookCategory.romance,
      availableAddons: [
        Addon(name: "Magnetic Bookmark", price: 2.49),
        Addon(name: "Personalized Bookplate", price: 2.99),
        Addon(name: "Special Edition Cover", price: 4.99),
        Addon(name: "Exclusive Short Story", price: 3.49),
      ],
    ),

    Book(
      name: "Fifty Shades of Grey",
      description: "E.L. James' provocative story of a passionate and complex romance.",
      imagePath: "assets/fifty_shades_of_grey.jpeg",
      price: 10.99,
      category: BookCategory.romance,
      availableAddons: [
        Addon(name: "Signed Edition", price: 6.99),
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Exclusive Behind-the-Scenes Content", price: 4.99),
        Addon(name: "Gift Wrapping", price: 2.49),
      ],
    ),

    Book(
      name: "The Sun Is Also a Star",
      description: "Nicola Yoon’s story of a serendipitous romance over the course of one day.",
      imagePath: "assets/the_sun_is_also_a_star.jpeg",
      price: 7.49,
      category: BookCategory.romance,
      availableAddons: [
        Addon(name: "Custom Bookplate", price: 2.49),
        Addon(name: "Personalized Annotations", price: 2.99),
        Addon(name: "Companion Book of Poems", price: 3.99),
        Addon(name: "Movie Adaptation DVD", price: 5.99),
      ],
    ),

    Book(
      name: "The Deal",
      description: "Elle Kennedy’s college romance involving a fake relationship turning real.",
      imagePath: "assets/the_deal.jpeg",
      price: 8.99,
      category: BookCategory.romance,
      availableAddons: [
        Addon(name: "Signed Bookplate", price: 4.99),
        Addon(name: "Custom Cover", price: 3.99),
        Addon(name: "Romance-themed Bookmark", price: 1.49),
        Addon(name: "Companion Recipe Book", price: 4.99),
      ],
    ),

    Book(
      name: "A Court of Thorns and Roses",
      description: "Sarah J. Maas’ fantasy romance set in a magical world of faeries and love.",
      imagePath: "assets/a_court_of_thorns_and_roses.jpeg",
      price: 12.99,
      category: BookCategory.romance,
      availableAddons: [
        Addon(name: "Custom Cover", price: 4.99),
        Addon(name: "Signed Edition", price: 7.99),
        Addon(name: "Map of the Fantasy World", price: 3.49),
        Addon(name: "Exclusive Bookmarks", price: 2.49),
      ],
    ),

    Book(
      name: "After",
      description: "Anna Todd’s story of a tumultuous relationship during college.",
      imagePath: "assets/after.jpeg",
      price: 9.49,
      category: BookCategory.romance,
      availableAddons: [
        Addon(name: "Personalized Dedication", price: 3.99),
        Addon(name: "Signed Bookplate", price: 5.99),
        Addon(name: "Matching Journal", price: 4.99),
        Addon(name: "Gift Wrapping", price: 2.49),
      ],
    ),

    Book(
      name: "The Perfect Hope",
      description: "Nora Roberts’ tale of a romance with a hint of mystery and destiny.",
      imagePath: "assets/the_perfect_hope.jpeg",
      price: 8.99,
      category: BookCategory.romance,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 1.99),
        Addon(name: "Signed Edition", price: 5.99),
        Addon(name: "Exclusive Interview with the Author", price: 4.99),
        Addon(name: "Gift Wrapping", price: 2.49),
      ],
    ),

    Book(
      name: "The Selection",
      description: "Kiera Cass’ romantic tale set in a dystopian future with a royal competition.",
      imagePath: "assets/the_selection.jpeg",
      price: 9.49,
      category: BookCategory.romance,
      availableAddons: [
        Addon(name: "Special Edition Cover", price: 4.99),
        Addon(name: "Signed Bookplate", price: 5.99),
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Companion Novel Excerpt", price: 3.99),
      ],
    ),

    Book(
      name: "The Flatshare",
      description: "Beth O’Leary’s story of two people sharing a flat and developing a unique romantic relationship.",
      imagePath: "assets/the_flatshare.jpeg",
      price: 7.99,
      category: BookCategory.romance,
      availableAddons: [
        Addon(name: "Gift Wrapping", price: 2.49),
        Addon(name: "Custom Bookplate", price: 2.49),
        Addon(name: "Personalized Notes from the Author", price: 3.99),
        Addon(name: "Exclusive Bookmarks", price: 1.99),
      ],
    ),

    // education
    Book(
      name: "The Power of Habit",
      description: "Charles Duhigg’s exploration of how habits work and how they can be transformed.",
      imagePath: "assets/the_power_of_habit.jpeg",
      price: 9.99,
      category: BookCategory.education,
      availableAddons: [
        Addon(name: "Workbook", price: 5.99),
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook Version", price: 7.99),
        Addon(name: "Study Guide", price: 4.99),
      ],
    ),

    Book(
      name: "Thinking, Fast and Slow",
      description: "Daniel Kahneman’s comprehensive examination of how we think and make decisions.",
      imagePath: "assets/thinking_fast_and_slow.jpeg",
      price: 12.99,
      category: BookCategory.education,
      availableAddons: [
        Addon(name: "Custom Notes", price: 3.49),
        Addon(name: "Workbook", price: 6.99),
        Addon(name: "Audiobook", price: 8.49),
        Addon(name: "Author Interview DVD", price: 4.99),
      ],
    ),

    Book(
      name: "Sapiens: A Brief History of Humankind",
      description: "Yuval Noah Harari’s insightful exploration of human history from the Stone Age to the modern age.",
      imagePath: "assets/sapiens.jpeg",
      price: 10.49,
      category: BookCategory.education,
      availableAddons: [
        Addon(name: "Discussion Guide", price: 3.99),
        Addon(name: "Custom Bookmark", price: 1.99),
        Addon(name: "Author’s Interview", price: 5.99),
        Addon(name: "Audiobook", price: 7.99),
      ],
    ),

    Book(
      name: "Educated",
      description: "Tara Westover’s memoir of growing up in a strict and abusive household in rural Idaho and her quest for education.",
      imagePath: "assets/educated.jpeg",
      price: 9.49,
      category: BookCategory.education,
      availableAddons: [
        Addon(name: "Personalized Bookplate", price: 2.49),
        Addon(name: "Discussion Questions", price: 3.49),
        Addon(name: "Audiobook", price: 7.99),
        Addon(name: "Exclusive Author Q&A", price: 4.99),
      ],
    ),

    Book(
      name: "How to Win Friends and Influence People",
      description: "Dale Carnegie’s classic guide on effective communication and interpersonal skills.",
      imagePath: "assets/how_to_win_friends.jpeg",
      price: 8.99,
      category: BookCategory.education,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 1.99),
        Addon(name: "Workbook", price: 5.49),
        Addon(name: "Audiobook", price: 6.99),
        Addon(name: "Motivational Posters", price: 4.49),
      ],
    ),

    Book(
      name: "Atomic Habits",
      description: "James Clear’s practical guide to building good habits and breaking bad ones.",
      imagePath: "assets/atomic_habits.jpeg",
      price: 10.99,
      category: BookCategory.education,
      availableAddons: [
        Addon(name: "Habit Tracker Journal", price: 6.99),
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 7.49),
        Addon(name: "Workbook", price: 5.99),
      ],
    ),

    Book(
      name: "Grit: The Power of Passion and Perseverance",
      description: "Angela Duckworth’s exploration of how grit and perseverance contribute to success.",
      imagePath: "assets/grit.jpeg",
      price: 9.49,
      category: BookCategory.education,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 1.99),
        Addon(name: "Workbook", price: 5.49),
        Addon(name: "Audiobook", price: 7.99),
        Addon(name: "Inspirational Quote Cards", price: 3.49),
      ],
    ),

    Book(
      name: "The 7 Habits of Highly Effective People",
      description: "Stephen R. Covey’s influential book on personal and professional effectiveness.",
      imagePath: "assets/7_habits.jpeg",
      price: 11.99,
      category: BookCategory.education,
      availableAddons: [
        Addon(name: "Custom Planner", price: 6.99),
        Addon(name: "Audiobook", price: 8.49),
        Addon(name: "Discussion Guide", price: 4.99),
        Addon(name: "Motivational Posters", price: 4.49),
      ],
    ),

    Book(
      name: "Mindset: The New Psychology of Success",
      description: "Carol S. Dweck’s groundbreaking work on the power of mindset in achieving success.",
      imagePath: "assets/mindset.jpeg",
      price: 9.99,
      category: BookCategory.education,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 7.49),
        Addon(name: "Workbook", price: 5.99),
        Addon(name: "Motivational Quote Cards", price: 3.49),
      ],
    ),

    Book(
      name: "The Lean Startup",
      description: "Eric Ries’ guide on how to build a successful startup using lean methodology.",
      imagePath: "assets/the_lean_startup.jpeg",
      price: 10.49,
      category: BookCategory.education,
      availableAddons: [
        Addon(name: "Startup Toolkit", price: 7.99),
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 8.49),
        Addon(name: "Discussion Guide", price: 4.49),
      ],
    ),

    Book(
      name: "Drive: The Surprising Truth About What Motivates Us",
      description: "Daniel H. Pink’s exploration of the science behind motivation and how to harness it.",
      imagePath: "assets/drive.jpeg",
      price: 9.49,
      category: BookCategory.education,
      availableAddons: [
        Addon(name: "Motivational Poster Set", price: 4.99),
        Addon(name: "Custom Bookmark", price: 1.99),
        Addon(name: "Audiobook", price: 7.99),
        Addon(name: "Discussion Guide", price: 3.49),
      ],
    ),

    Book(
      name: "Quiet: The Power of Introverts in a World That Can’t Stop Talking",
      description: "Susan Cain’s insightful look at the strengths and challenges of introverts.",
      imagePath: "assets/quiet.jpeg",
      price: 8.99,
      category: BookCategory.education,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 1.99),
        Addon(name: "Workbook", price: 5.49),
        Addon(name: "Audiobook", price: 7.49),
        Addon(name: "Discussion Questions", price: 3.99),
      ],
    ),

    Book(
      name: "The Art of Public Speaking",
      description: "Dale Carnegie’s guide to improving public speaking skills and overcoming fear.",
      imagePath: "assets/art_of_public_speaking.jpeg",
      price: 7.99,
      category: BookCategory.education,
      availableAddons: [
        Addon(name: "Public Speaking Workbook", price: 5.99),
        Addon(name: "Custom Bookmark", price: 1.99),
        Addon(name: "Audiobook", price: 6.99),
        Addon(name: "Speech Practice Guide", price: 4.49),
      ],
    ),

    Book(
      name: "The 5 Love Languages",
      description: "Gary Chapman’s guide to understanding and expressing love in five different ways.",
      imagePath: "assets/5_love_languages.jpeg",
      price: 8.49,
      category: BookCategory.education,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 1.99),
        Addon(name: "Discussion Guide", price: 3.49),
        Addon(name: "Audiobook", price: 7.49),
        Addon(name: "Inspirational Quote Cards", price: 3.49),
      ],
    ),

    Book(
      name: "The 4-Hour Workweek",
      description: "Tim Ferriss’ guide to escaping the 9-5 grind and living life on your own terms.",
      imagePath: "assets/4_hour_workweek.jpeg",
      price: 10.99,
      category: BookCategory.education,
      availableAddons: [
        Addon(name: "Custom Planner", price: 6.99),
        Addon(name: "Audiobook", price: 8.49),
        Addon(name: "Discussion Guide", price: 4.49),
        Addon(name: "Motivational Posters", price: 4.99),
      ],
    ),

    Book(
      name: "Deep Work: Rules for Focused Success in a Distracted World",
      description: "Cal Newport’s exploration of how to achieve focused work and productivity in a world full of distractions.",
      imagePath: "assets/deep_work.jpeg",
      price: 9.49,
      category: BookCategory.education,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Workbook", price: 5.99),
        Addon(name: "Audiobook", price: 7.49),
        Addon(name: "Productivity Planner", price: 4.49),
      ],
    ),

    Book(
      name: "Start with Why: How Great Leaders Inspire Everyone to Take Action",
      description: "Simon Sinek’s examination of how leaders can inspire action by focusing on the 'why'.",
      imagePath: "assets/start_with_why.jpeg",
      price: 8.99,
      category: BookCategory.education,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 1.99),
        Addon(name: "Discussion Guide", price: 3.49),
        Addon(name: "Audiobook", price: 7.49),
        Addon(name: "Inspirational Quote Cards", price: 3.49),
      ],
    ),

    Book(
      name: "The Innovator’s Dilemma",
      description: "Clayton Christensen’s study on why successful companies can fail and how to avoid it.",
      imagePath: "assets/innovators_dilemma.jpeg",
      price: 11.49,
      category: BookCategory.education,
      availableAddons: [
        Addon(name: "Innovation Toolkit", price: 7.99),
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 8.49),
        Addon(name: "Discussion Guide", price: 4.49),
      ],
    ),

    Book(
      name: "Principles: Life and Work",
      description: "Ray Dalio’s principles for achieving success in both life and business.",
      imagePath: "assets/principles.jpeg",
      price: 12.49,
      category: BookCategory.education,
      availableAddons: [
        Addon(name: "Custom Planner", price: 6.99),
        Addon(name: "Audiobook", price: 8.49),
        Addon(name: "Discussion Guide", price: 4.99),
        Addon(name: "Motivational Posters", price: 4.49),
      ],
    ),

    Book(
      name: "The Compound Effect",
      description: "Darren Hardy’s guide to making small changes to achieve big results.",
      imagePath: "assets/compound_effect.jpeg",
      price: 9.49,
      category: BookCategory.education,
      availableAddons: [
        Addon(name: "Custom Planner", price: 6.99),
        Addon(name: "Audiobook", price: 7.49),
        Addon(name: "Workbook", price: 5.49),
        Addon(name: "Motivational Posters", price: 4.49),
      ],
    ),

    Book(
      name: "The Art of Learning",
      description: "Josh Waitzkin’s exploration of how to master the art of learning and personal growth.",
      imagePath: "assets/art_of_learning.jpeg",
      price: 10.49,
      category: BookCategory.education,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Workbook", price: 5.99),
        Addon(name: "Audiobook", price: 7.49),
        Addon(name: "Discussion Guide", price: 4.49),
      ],
    ),

    Book(
      name: "Dare to Lead: Brave Work. Tough Conversations. Whole Hearts.",
      description: "Brené Brown’s guide to leading with courage and empathy.",
      imagePath: "assets/dare_to_lead.jpeg",
      price: 11.99,
      category: BookCategory.education,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Workbook", price: 6.99),
        Addon(name: "Audiobook", price: 8.49),
        Addon(name: "Leadership Toolkit", price: 5.99),
      ],
    ),

    // adventure
    Book(
      name: "Into the Wild",
      description: "Jon Krakauer’s gripping account of Christopher McCandless’s journey into the Alaskan wilderness.",
      imagePath: "assets/into_the_wild.jpeg",
      price: 9.99,
      category: BookCategory.adventure,
      availableAddons: [
        Addon(name: "Adventure Journal", price: 5.99),
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 7.49),
        Addon(name: "Discussion Guide", price: 3.49),
      ],
    ),

    Book(
      name: "Life of Pi",
      description: "Yann Martel’s fantastical tale of Pi Patel’s survival at sea with a Bengal tiger.",
      imagePath: "assets/life_of_pi.jpeg",
      price: 10.49,
      category: BookCategory.adventure,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 8.49),
        Addon(name: "Discussion Guide", price: 4.49),
        Addon(name: "Art Print of Pi and Richard Parker", price: 6.99),
      ],
    ),

    Book(
      name: "The Hobbit",
      description: "J.R.R. Tolkien’s classic prelude to the Lord of the Rings, following Bilbo Baggins on his epic quest.",
      imagePath: "assets/the_hobbit.jpeg",
      price: 11.99,
      category: BookCategory.adventure,
      availableAddons: [
        Addon(name: "Middle-Earth Map", price: 4.99),
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 8.99),
        Addon(name: "Character Stickers", price: 3.99),
      ],
    ),

    Book(
      name: "The Call of the Wild",
      description: "Jack London’s thrilling story of Buck, a domesticated dog who returns to his wild roots.",
      imagePath: "assets/call_of_the_wild.jpeg",
      price: 8.99,
      category: BookCategory.adventure,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 7.49),
        Addon(name: "Discussion Guide", price: 3.49),
        Addon(name: "Wildlife Photography Book", price: 5.99),
      ],
    ),

    Book(
      name: "Treasure Island",
      description: "Robert Louis Stevenson’s timeless adventure of pirates, treasure maps, and the quest for hidden gold.",
      imagePath: "assets/treasure_island.jpeg",
      price: 9.49,
      category: BookCategory.adventure,
      availableAddons: [
        Addon(name: "Pirate Map", price: 4.99),
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 7.49),
        Addon(name: "Treasure Chest Puzzle", price: 5.49),
      ],
    ),

    Book(
      name: "Journey to the Center of the Earth",
      description: "Jules Verne’s imaginative tale of a subterranean adventure through the depths of the Earth.",
      imagePath: "assets/journey_center_earth.jpeg",
      price: 10.99,
      category: BookCategory.adventure,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 8.49),
        Addon(name: "Discussion Guide", price: 3.49),
        Addon(name: "Adventure Map", price: 5.99),
      ],
    ),

    Book(
      name: "The Lost City of Z",
      description: "David Grann’s compelling account of the search for a legendary lost city in the Amazon rainforest.",
      imagePath: "assets/lost_city_of_z.jpeg",
      price: 11.49,
      category: BookCategory.adventure,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Adventure Journal", price: 6.99),
        Addon(name: "Audiobook", price: 8.49),
        Addon(name: "Amazon Rainforest Map", price: 5.49),
      ],
    ),

    Book(
      name: "The Road",
      description: "Cormac McCarthy’s haunting post-apocalyptic tale of a father and son’s journey across a desolate landscape.",
      imagePath: "assets/the_road.jpeg",
      price: 9.49,
      category: BookCategory.adventure,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 7.49),
        Addon(name: "Discussion Guide", price: 3.49),
        Addon(name: "Survival Guide", price: 5.99),
      ],
    ),

    Book(
      name: "The Beach",
      description: "Alex Garland’s gripping story of a backpacker’s search for a hidden paradise in Thailand.",
      imagePath: "assets/the_beach.jpeg",
      price: 10.49,
      category: BookCategory.adventure,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 7.49),
        Addon(name: "Discussion Guide", price: 3.49),
        Addon(name: "Travel Guide to Thailand", price: 6.99),
      ],
    ),

    Book(
      name: "The Jungle Book",
      description: "Rudyard Kipling’s classic collection of stories about Mowgli, a boy raised by wolves in the Indian jungle.",
      imagePath: "assets/jungle_book.jpeg",
      price: 8.99,
      category: BookCategory.adventure,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 6.99),
        Addon(name: "Discussion Guide", price: 3.49),
        Addon(name: "Jungle Map", price: 5.49),
      ],
    ),

    Book(
      name: "Around the World in Eighty Days",
      description: "Jules Verne’s adventurous tale of Phileas Fogg’s race against time to circumnavigate the globe.",
      imagePath: "assets/around_world.jpeg",
      price: 9.49,
      category: BookCategory.adventure,
      availableAddons: [
        Addon(name: "World Map", price: 4.99),
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 7.49),
        Addon(name: "Travel Guide", price: 5.99),
      ],
    ),

    Book(
      name: "The Count of Monte Cristo",
      description: "Alexandre Dumas’s epic tale of revenge, adventure, and redemption.",
      imagePath: "assets/count_of_monte_cristo.jpeg",
      price: 12.99,
      category: BookCategory.adventure,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 8.49),
        Addon(name: "Discussion Guide", price: 4.49),
        Addon(name: "Historical Map of France", price: 5.99),
      ],
    ),

    Book(
      name: "Hatchet",
      description: "Gary Paulsen’s gripping survival story of a boy stranded in the Canadian wilderness.",
      imagePath: "assets/hatchet.jpeg",
      price: 8.49,
      category: BookCategory.adventure,
      availableAddons: [
        Addon(name: "Survival Kit", price: 6.99),
        Addon(name: "Custom Bookmark", price: 1.99),
        Addon(name: "Audiobook", price: 7.49),
        Addon(name: "Discussion Guide", price: 3.49),
      ],
    ),

    Book(
      name: "The Maze Runner",
      description: "James Dashner’s thrilling story of a group of teens trapped in a maze with no memory of their past.",
      imagePath: "assets/maze_runner.jpeg",
      price: 9.99,
      category: BookCategory.adventure,
      availableAddons: [
        Addon(name: "Maze Map", price: 4.99),
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 8.49),
        Addon(name: "Discussion Guide", price: 3.49),
      ],
    ),

    Book(
      name: "The Girl with the Dragon Tattoo",
      description: "Stieg Larsson’s gripping mystery and adventure tale featuring Lisbeth Salander and Mikael Blomkvist.",
      imagePath: "assets/dragon_tattoo.jpeg",
      price: 10.99,
      category: BookCategory.adventure,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 8.49),
        Addon(name: "Discussion Guide", price: 4.49),
        Addon(name: "Mystery Puzzle", price: 6.99),
      ],
    ),

    Book(
      name: "The Island of Dr. Moreau",
      description: "H.G. Wells’s science fiction adventure about a man stranded on an island where animals are turned into humans.",
      imagePath: "assets/dr_moreau.jpeg",
      price: 8.99,
      category: BookCategory.adventure,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 6.99),
        Addon(name: "Discussion Guide", price: 3.49),
        Addon(name: "Science Fiction Map", price: 5.99),
      ],
    ),

    Book(
      name: "The Last of the Mohicans",
      description: "James Fenimore Cooper’s classic adventure set during the French and Indian War.",
      imagePath: "assets/last_mohicans.jpeg",
      price: 9.49,
      category: BookCategory.adventure,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 7.49),
        Addon(name: "Discussion Guide", price: 4.49),
        Addon(name: "Historical Map", price: 5.49),
      ],
    ),

    Book(
      name: "Robinson Crusoe",
      description: "Daniel Defoe’s classic tale of a man stranded on a desert island and his struggle for survival.",
      imagePath: "assets/robinson_crusoe.jpeg",
      price: 9.99,
      category: BookCategory.adventure,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 7.49),
        Addon(name: "Survival Guide", price: 5.99),
        Addon(name: "Discussion Guide", price: 3.49),
      ],
    ),

    Book(
      name: "Swiss Family Robinson",
      description: "Johann David Wyss’s adventurous story of a Swiss family shipwrecked on a tropical island.",
      imagePath: "assets/swiss_family_robinson.jpeg",
      price: 8.49,
      category: BookCategory.adventure,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 6.99),
        Addon(name: "Survival Kit", price: 5.99),
        Addon(name: "Discussion Guide", price: 3.49),
      ],
    ),

    Book(
      name: "Jurassic Park",
      description: "Michael Crichton’s thrilling adventure about the creation of a dinosaur theme park and its disastrous consequences.",
      imagePath: "assets/jurassic_park.jpeg",
      price: 11.99,
      category: BookCategory.adventure,
      availableAddons: [
        Addon(name: "Dinosaur Model Kit", price: 9.99),
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 8.49),
        Addon(name: "Discussion Guide", price: 4.49),
      ],
    ),

    Book(
      name: "The Mysterious Island",
      description: "Jules Verne’s adventure of a group of castaways who survive on a mysterious island.",
      imagePath: "assets/mysterious_island.jpeg",
      price: 10.49,
      category: BookCategory.adventure,
      availableAddons: [
        Addon(name: "Island Map", price: 4.99),
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 8.49),
        Addon(name: "Discussion Guide", price: 3.49),
      ],
    ),

    Book(
      name: "The Secret Garden",
      description: "Frances Hodgson Burnett’s enchanting story of a young girl who discovers a hidden garden.",
      imagePath: "assets/secret_garden.jpeg",
      price: 7.99,
      category: BookCategory.adventure,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 1.99),
        Addon(name: "Garden Map", price: 4.99),
        Addon(name: "Audiobook", price: 6.99),
        Addon(name: "Discussion Guide", price: 3.49),
      ],
    ),

    Book(
      name: "The Three Musketeers",
      description: "Alexandre Dumas’s swashbuckling adventure of d’Artagnan and his three musketeer friends.",
      imagePath: "assets/three_musketeers.jpeg",
      price: 9.99,
      category: BookCategory.adventure,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 7.49),
        Addon(name: "Discussion Guide", price: 4.49),
        Addon(name: "Historical Map of France", price: 5.99),
      ],
    ),

    Book(
      name: "Moby-Dick",
      description: "Herman Melville’s epic adventure of Captain Ahab’s quest to hunt the great white whale, Moby-Dick.",
      imagePath: "assets/moby_dick.jpeg",
      price: 11.49,
      category: BookCategory.adventure,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 8.49),
        Addon(name: "Discussion Guide", price: 4.49),
        Addon(name: "Whale Model Kit", price: 6.99),
      ],
    ),

    // History
    Book(
      name: "Sapiens: A Brief History of Humankind",
      description: "Yuval Noah Harari’s exploration of the history of the human species from the Stone Age to the modern era.",
      imagePath: "assets/sapiens.jpeg",
      price: 12.99,
      category: BookCategory.history,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 9.49),
        Addon(name: "Discussion Guide", price: 4.49),
        Addon(name: "Historical Timeline Poster", price: 5.99),
      ],
    ),

    Book(
      name: "Guns, Germs, and Steel",
      description: "Jared Diamond’s comprehensive study on the factors that shaped the modern world.",
      imagePath: "assets/guns_germs_steel.jpeg",
      price: 11.99,
      category: BookCategory.history,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 8.99),
        Addon(name: "Discussion Guide", price: 3.49),
        Addon(name: "Historical Map of Civilizations", price: 5.49),
      ],
    ),

    Book(
      name: "The Diary of a Young Girl",
      description: "Anne Frank’s poignant diary detailing her life in hiding during World War II.",
      imagePath: "assets/diary_young_girl.jpeg",
      price: 9.99,
      category: BookCategory.history,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 7.49),
        Addon(name: "Discussion Guide", price: 3.49),
        Addon(name: "WWII Historical Context Guide", price: 4.99),
      ],
    ),

    Book(
      name: "The Rise and Fall of the Third Reich",
      description: "William L. Shirer’s comprehensive history of Nazi Germany from its rise to its fall.",
      imagePath: "assets/rise_fall_third_reich.jpeg",
      price: 14.99,
      category: BookCategory.history,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 10.49),
        Addon(name: "Discussion Guide", price: 4.49),
        Addon(name: "Nazi Germany Map", price: 5.99),
      ],
    ),

    Book(
      name: "A People’s History of the United States",
      description: "Howard Zinn’s critical perspective on American history from the perspective of marginalized groups.",
      imagePath: "assets/peoples_history_us.jpeg",
      price: 12.49,
      category: BookCategory.history,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 8.99),
        Addon(name: "Discussion Guide", price: 3.49),
        Addon(name: "American History Timeline Poster", price: 5.99),
      ],
    ),

    Book(
      name: "The History of the Ancient World",
      description: "Susan Wise Bauer’s detailed narrative of the history of the ancient world, from the earliest records to the fall of Rome.",
      imagePath: "assets/history_ancient_world.jpeg",
      price: 13.99,
      category: BookCategory.history,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 9.49),
        Addon(name: "Discussion Guide", price: 4.49),
        Addon(name: "Ancient World Map", price: 6.99),
      ],
    ),

    Book(
      name: "The Silk Roads: A New History of the World",
      description: "Peter Frankopan’s groundbreaking book that explores the history of the Silk Roads and their influence on world history.",
      imagePath: "assets/silk_roads.jpeg",
      price: 11.49,
      category: BookCategory.history,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 8.49),
        Addon(name: "Discussion Guide", price: 3.49),
        Addon(name: "Silk Roads Map", price: 5.49),
      ],
    ),

    Book(
      name: "The History of Rome",
      description: "Mary Beard’s engaging and insightful history of Rome from its beginnings to the fall of the Western Empire.",
      imagePath: "assets/history_rome.jpeg",
      price: 12.99,
      category: BookCategory.history,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 9.49),
        Addon(name: "Discussion Guide", price: 4.49),
        Addon(name: "Roman Empire Map", price: 6.99),
      ],
    ),

    Book(
      name: "The Guns of August",
      description: "Barbara W. Tuchman’s account of the events leading up to and the first month of World War I.",
      imagePath: "assets/guns_of_august.jpeg",
      price: 10.49,
      category: BookCategory.history,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 7.49),
        Addon(name: "Discussion Guide", price: 3.49),
        Addon(name: "WWI Historical Map", price: 5.99),
      ],
    ),

    Book(
      name: "The Immortal Life of Henrietta Lacks",
      description: "Rebecca Skloot’s compelling narrative of Henrietta Lacks’s cells, which became one of the most important tools in medicine.",
      imagePath: "assets/immortal_life.jpeg",
      price: 11.99,
      category: BookCategory.history,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 8.49),
        Addon(name: "Discussion Guide", price: 4.49),
        Addon(name: "Medical History Poster", price: 5.99),
      ],
    ),

    Book(
      name: "The Origins of Political Order",
      description: "Francis Fukuyama’s exploration of how political institutions evolved from prehuman times to the French Revolution.",
      imagePath: "assets/origins_political_order.jpeg",
      price: 13.49,
      category: BookCategory.history,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 9.49),
        Addon(name: "Discussion Guide", price: 4.49),
        Addon(name: "Political History Timeline Poster", price: 6.99),
      ],
    ),

    Book(
      name: "The American Revolution: A History",
      description: "Gordon S. Wood’s concise and engaging account of the American Revolution and its impact.",
      imagePath: "assets/american_revolution_history.jpeg",
      price: 10.49,
      category: BookCategory.history,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 7.49),
        Addon(name: "Discussion Guide", price: 3.49),
        Addon(name: "American Revolution Map", price: 5.49),
      ],
    ),

    Book(
      name: "The History of Western Philosophy",
      description: "Bertrand Russell’s comprehensive overview of Western philosophy from ancient Greece to the early 20th century.",
      imagePath: "assets/history_western_philosophy.jpeg",
      price: 14.99,
      category: BookCategory.history,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 10.49),
        Addon(name: "Discussion Guide", price: 5.49),
        Addon(name: "Philosophy Timeline Poster", price: 6.99),
      ],
    ),

    Book(
      name: "The Roman Empire: A Very Short Introduction",
      description: "Christopher Kelly’s concise introduction to the history of the Roman Empire.",
      imagePath: "assets/roman_empire_intro.jpeg",
      price: 8.99,
      category: BookCategory.history,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 6.99),
        Addon(name: "Discussion Guide", price: 3.49),
        Addon(name: "Roman Empire Map", price: 5.49),
      ],
    ),

    Book(
      name: "The World: A History",
      description: "Felipe Fernández-Armesto’s broad and engaging history of the world from ancient times to the present.",
      imagePath: "assets/world_history.jpeg",
      price: 13.99,
      category: BookCategory.history,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 9.49),
        Addon(name: "Discussion Guide", price: 4.49),
        Addon(name: "World History Timeline Poster", price: 6.99),
      ],
    ),

    Book(
      name: "The History of the Ancient World",
      description: "Susan Wise Bauer’s comprehensive narrative of ancient history, covering civilizations from the earliest records to the fall of Rome.",
      imagePath: "assets/history_ancient_world.jpeg",
      price: 12.99,
      category: BookCategory.history,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 8.99),
        Addon(name: "Discussion Guide", price: 4.49),
        Addon(name: "Ancient World Map", price: 5.99),
      ],
    ),

    Book(
      name: "The Making of the Atomic Bomb",
      description: "Richard Rhodes’s detailed account of the development of the atomic bomb and its impact on the world.",
      imagePath: "assets/making_atomic_bomb.jpeg",
      price: 11.49,
      category: BookCategory.history,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 8.49),
        Addon(name: "Discussion Guide", price: 4.49),
        Addon(name: "Historical Context Poster", price: 6.99),
      ],
    ),

    Book(
      name: "The History of Byzantium",
      description: "Anthony Kaldellis’s examination of the Byzantine Empire, exploring its history and influence.",
      imagePath: "assets/history_byzantium.jpeg",
      price: 12.49,
      category: BookCategory.history,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 9.49),
        Addon(name: "Discussion Guide", price: 4.49),
        Addon(name: "Byzantine Empire Map", price: 5.99),
      ],
    ),

    Book(
      name: "The Age of Revolution: 1789-1848",
      description: "Eric Hobsbawm’s exploration of the transformative period of the late 18th and early 19th centuries.",
      imagePath: "assets/age_revolution.jpeg",
      price: 11.99,
      category: BookCategory.history,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 8.49),
        Addon(name: "Discussion Guide", price: 4.49),
        Addon(name: "Revolutionary Era Map", price: 6.99),
      ],
    ),

    Book(
      name: "The Age of Empire: 1875-1914",
      description: "Eric Hobsbawm’s analysis of the imperial age and its impact on the world.",
      imagePath: "assets/age_empire.jpeg",
      price: 12.49,
      category: BookCategory.history,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 9.49),
        Addon(name: "Discussion Guide", price: 4.49),
        Addon(name: "Imperial Era Map", price: 6.99),
      ],
    ),

    Book(
      name: "The Origins of Totalitarianism",
      description: "Hannah Arendt’s analysis of the rise of totalitarian regimes in the 20th century.",
      imagePath: "assets/origins_totalitarianism.jpeg",
      price: 13.49,
      category: BookCategory.history,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 10.49),
        Addon(name: "Discussion Guide", price: 5.49),
        Addon(name: "Totalitarian Regimes Map", price: 6.99),
      ],
    ),

    Book(
      name: "The History of Medieval Europe",
      description: "J.M. Roberts’s comprehensive overview of medieval European history.",
      imagePath: "assets/history_medieval_europe.jpeg",
      price: 12.99,
      category: BookCategory.history,
      availableAddons: [
        Addon(name: "Custom Bookmark", price: 2.49),
        Addon(name: "Audiobook", price: 9.49),
        Addon(name: "Discussion Guide", price: 4.49),
        Addon(name: "Medieval Europe Map", price: 6.99),
      ],
    ),

  ];

   //default delivery address

  String _deliveryAddress = 'Balkumari,Lalitpur';

   List<Book> get menu => _menu;

  // User cart
   List<CartItem> _cart = [];

  List<CartItem> get cart => _cart;

  String get deliveryAddress => _deliveryAddress;

  // Add to cart
  void addToCart(Book book, List<Addon> selectedAddons) {
    // Check if there is already a cart item with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull(
          (item) {
        bool isSameFood = item.book == book;
        bool isSameAddons = ListEquality().equals(item.selectedAddons, selectedAddons);
        return isSameFood && isSameAddons;
      },
      // orElse: () => null,
    );

    // If item already exists, increase its quantity
    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      // Otherwise, add new cart item to the cart
      _cart.add(CartItem(
        book: book,
        selectedAddons: selectedAddons,

      ));
    }

    notifyListeners();
  }

  // Remove from cart
  void removeFromCart(CartItem cartItem){

    int cartIndex = _cart.indexOf(cartItem);

    if(cartIndex != -1){
      _cart[cartIndex].quantity--;
    }else{
      _cart.removeAt(cartIndex);
    }
    notifyListeners();
  }


  //update the delivery address

  void updateDeliveryAddress(String newAddress){
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  // Get total price of cart
  double getTotalPrice() {

    double total=0.0;

    for(CartItem cartItem in _cart){
      double itemTotal = cartItem.book.price;

      for(Addon addon in cartItem.selectedAddons){
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  // Get total number of items in cart
  int getTotalItemCount() {
    int totalItemCount=1;

    for(CartItem cartItem in _cart){
     totalItemCount += cartItem.quantity;



    }
    return totalItemCount;
  }



  // Clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();

    // Format the date to include up to seconds only
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    receipt.writeln(formattedDate);
    receipt.writeln();

    // Format each cart item
    for (final cartItem in cart) {
      receipt.writeln("${cartItem.quantity} x ${cartItem.book.name} - ${_formatPrice(cartItem.book.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln("Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
    }

    receipt.writeln("-----------");
    receipt.writeln();
    receipt.writeln("Total Item: ${getTotalItemCount()}");
    receipt.writeln("Total: ${_formatPrice(getTotalPrice())}");

    return receipt.toString();
  }


  String _formatPrice(double price){
   return "\$${price.toStringAsFixed(2)}";
  }

  String _formatAddons(List<Addon> addons){
    return addons.map((addon) => "${addon.name}  (${_formatPrice(addon.price)})").join(",");
  }
}
