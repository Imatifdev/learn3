import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn3/models/course_model.dart';
import 'package:learn3/view/course/course_detail.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf6fafe),
      appBar: AppBar(
        title: const Text('View All Courses'),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return Card(
            elevation: 4,
            color: Colors.white,
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                    fit: BoxFit.cover,
                    course.thumbnail,
                    width: 80,
                    height: 100),
              ),
              title: Text(course.title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Enrolled Students ${course.enrollments.toString()}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text("Rating:   "),
                      RatingBar.readOnly(
                        isHalfAllowed: true,
                        alignment: Alignment.center,
                        filledIcon: Icons.star,
                        size: 15,
                        emptyIcon: Icons.star_border,
                        emptyColor: Colors.redAccent,
                        filledColor: Colors.yellow.shade800,
                        halfFilledColor: Colors.amberAccent,
                        halfFilledIcon: Icons.star_half,
                        initialRating: course.ratings,
                        maxRating: 5,
                      ),
                    ],
                  ),
                ],
              ),
              trailing: Icon(CupertinoIcons.right_chevron),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CourseDetailPage(course: course),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

List<Course> courses = [
  Course(
    title: "Introduction to Blockchain",
    points: "100",
    duration: "4 days",
    thumbnail:
        "https://www.the-blockchain.com/wp-content/uploads/2022/02/Blockchain-Service.jpg",
    ratings: 4.8,
    enrollments: 1500,
    about:
        "Learn the basics of blockchain technology, its applications, and its impact on various industries.",
    sections: [
      Section(
          title: "Blockchain Overview",
          readingMaterial: "Blockchain is a distributed ledger technology..."),
      Section(
          title: "Cryptography Basics",
          readingMaterial:
              "Cryptography ensures the security and integrity of blockchain transactions..."),
      Section(
          title: "Smart Contracts",
          readingMaterial:
              "Smart contracts are self-executing contracts with the terms of the agreement directly written into code..."),
    ],
    quiz: [
      Question(
        questionText: "What is Blockchain?",
        options: [
          "A type of cryptocurrency",
          "A distributed ledger technology",
          "A programming language",
          "None of the above"
        ],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: "What ensures the security of blockchain transactions?",
        options: [
          "Hashing",
          "Encryption",
          "Smart Contracts",
          "All of the above"
        ],
        correctAnswerIndex: 3,
      ),
      Question(
        questionText: "What are smart contracts?",
        options: [
          "Legal agreements",
          "Self-executing contracts",
          "Distributed databases",
          "Cryptographic protocols"
        ],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: "Which industry is heavily impacted by blockchain?",
        options: ["Finance", "Healthcare", "Supply Chain", "All of the above"],
        correctAnswerIndex: 3,
      ),
      Question(
        questionText: "Which is the first blockchain-based cryptocurrency?",
        options: ["Ethereum", "Bitcoin", "Litecoin", "Ripple"],
        correctAnswerIndex: 1,
      ),
    ],
  ),
  Course(
    title: "Machine Learning Fundamentals",
    points: "120",
    duration: "6 days",
    thumbnail:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQU61gHjrBj82OI2mq97amNjrhOcN4ouggl7w&s",
    ratings: 4.7,
    enrollments: 2000,
    about:
        "Understand the principles of machine learning and how to implement them in real-world scenarios.",
    sections: [
      Section(
          title: "Introduction to Machine Learning",
          readingMaterial:
              "Machine learning is a field of artificial intelligence..."),
      Section(
          title: "Supervised Learning",
          readingMaterial:
              "Supervised learning involves training a model on labeled data..."),
      Section(
          title: "Unsupervised Learning",
          readingMaterial:
              "Unsupervised learning involves finding hidden patterns in unlabeled data..."),
    ],
    quiz: [
      Question(
        questionText: "What is machine learning?",
        options: [
          "A type of AI",
          "A programming language",
          "A framework",
          "A database"
        ],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: "What is supervised learning?",
        options: [
          "Learning with labeled data",
          "Learning without labeled data",
          "Reinforcement learning",
          "None of the above"
        ],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: "Which algorithm is used for classification?",
        options: ["K-Means", "Linear Regression", "Decision Trees", "PCA"],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: "Which is a common use case of unsupervised learning?",
        options: [
          "Spam filtering",
          "Image recognition",
          "Customer segmentation",
          "Language translation"
        ],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: "What is the goal of reinforcement learning?",
        options: [
          "Maximize a reward",
          "Minimize error",
          "Label data",
          "None of the above"
        ],
        correctAnswerIndex: 0,
      ),
    ],
  ),
  Course(
    title: "Web Development with JavaScript",
    points: "80",
    duration: "5 days",
    thumbnail:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdxs_IDn2MItequVkILR7UMicTp4U6u_rM4g&s",
    ratings: 4.6,
    enrollments: 1800,
    about:
        "Master the basics of web development using JavaScript, HTML, and CSS.",
    sections: [
      Section(
          title: "Introduction to HTML",
          readingMaterial:
              "HTML is the standard markup language for creating web pages..."),
      Section(
          title: "CSS for Styling",
          readingMaterial: "CSS is used to style and layout web pages..."),
      Section(
          title: "JavaScript Basics",
          readingMaterial:
              "JavaScript is a programming language used to create dynamic and interactive effects on web pages..."),
    ],
    quiz: [
      Question(
        questionText: "What does HTML stand for?",
        options: [
          "HyperText Markup Language",
          "HyperText Markdown Language",
          "HyperTool Markup Language",
          "HyperText Machine Language"
        ],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: "Which tag is used to link CSS?",
        options: ["<style>", "<link>", "<css>", "<script>"],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: "What is JavaScript primarily used for?",
        options: [
          "Data analysis",
          "Web development",
          "System programming",
          "Machine learning"
        ],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText:
            "Which property is used to change the background color in CSS?",
        options: ["color", "background-color", "bgcolor", "background"],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: "Which HTML tag is used to create a hyperlink?",
        options: ["<a>", "<link>", "<href>", "<hyperlink>"],
        correctAnswerIndex: 0,
      ),
    ],
  ),
  Course(
    title: "Introduction to Python Programming",
    points: "90",
    duration: "4 days",
    thumbnail:
        "https://cdn.the-scientist.com/assets/articleNo/71687/aImg/52292/62dc0501-8dda-4bd7-9ba9-fa1a9b8c7cb4-l.jpg",
    ratings: 4.9,
    enrollments: 2500,
    about:
        "Learn Python programming from scratch, one of the most popular and versatile programming languages.",
    sections: [
      Section(
          title: "Python Basics",
          readingMaterial:
              "Python is a high-level, interpreted programming language..."),
      Section(
          title: "Data Types and Variables",
          readingMaterial:
              "Python supports various data types including integers, floats, strings, and more..."),
      Section(
          title: "Control Structures",
          readingMaterial:
              "Control structures like loops and conditionals allow you to control the flow of your program..."),
    ],
    quiz: [
      Question(
        questionText: "What is Python?",
        options: [
          "A programming language",
          "A snake",
          "A web framework",
          "A database"
        ],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: "Which keyword is used to define a function in Python?",
        options: ["func", "def", "function", "lambda"],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: "Which data type is mutable in Python?",
        options: ["String", "Tuple", "List", "Integer"],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: "Which loop is used to iterate over a sequence?",
        options: ["for", "while", "do-while", "None of the above"],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: "What does the 'break' statement do?",
        options: [
          "Exits the loop",
          "Continues the loop",
          "Restarts the loop",
          "Ends the program"
        ],
        correctAnswerIndex: 0,
      ),
    ],
  ),
  Course(
    title: "Cybersecurity Essentials",
    points: "110",
    duration: "5 days",
    thumbnail:
        "https://www.telefonica.com/en/wp-content/uploads/sites/5/2023/11/Cybersecurity-policies-what-is-coming-next.jpg?w=1200&h=673&crop=1",
    ratings: 4.7,
    enrollments: 1400,
    about:
        "Gain a solid understanding of cybersecurity principles and practices to protect data and systems.",
    sections: [
      Section(
          title: "Introduction to Cybersecurity",
          readingMaterial:
              "Cybersecurity involves protecting systems, networks, and data from cyber attacks..."),
      Section(
          title: "Types of Cyber Threats",
          readingMaterial:
              "Common cyber threats include malware, phishing, ransomware, and more..."),
      Section(
          title: "Cybersecurity Best Practices",
          readingMaterial:
              "Implementing strong passwords, regular updates, and encryption are key practices..."),
    ],
    quiz: [
      Question(
        questionText: "What is cybersecurity?",
        options: [
          "Protecting systems from cyber attacks",
          "Creating secure networks",
          "Building firewalls",
          "All of the above"
        ],
        correctAnswerIndex: 3,
      ),
      Question(
        questionText: "Which is a common type of malware?",
        options: ["Virus", "Ransomware", "Spyware", "All of the above"],
        correctAnswerIndex: 3,
      ),
      Question(
        questionText: "What is phishing?",
        options: [
          "A type of social engineering attack",
          "A network vulnerability",
          "A type of firewall",
          "None of the above"
        ],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText:
            "Which of the following is a cybersecurity best practice?",
        options: [
          "Using strong passwords",
          "Regular software updates",
          "Encryption",
          "All of the above"
        ],
        correctAnswerIndex: 3,
      ),
      Question(
        questionText: "What does a firewall do?",
        options: [
          "Blocks unauthorized access",
          "Encrypts data",
          "Monitors traffic",
          "All of the above"
        ],
        correctAnswerIndex: 0,
      ),
    ],
  ),
  Course(
    title: "Data Science with R",
    points: "130",
    duration: "8 days",
    thumbnail:
        "https://cdn.prod.website-files.com/63ccf2f0ea97be12ead278ed/644a18b637053fa3709c5ba2_what-is-data-science.jpg",
    ratings: 4.6,
    enrollments: 1200,
    about:
        "Learn data science concepts and techniques using the R programming language.",
    sections: [
      Section(
          title: "Introduction to Data Science",
          readingMaterial:
              "Data science involves extracting knowledge and insights from structured and unstructured data..."),
      Section(
          title: "R Programming Basics",
          readingMaterial:
              "R is a programming language widely used for statistical analysis and data visualization..."),
      Section(
          title: "Data Visualization with R",
          readingMaterial:
              "R provides powerful tools like ggplot2 for creating data visualizations..."),
    ],
    quiz: [
      Question(
        questionText: "What is data science?",
        options: [
          "Extracting knowledge from data",
          "Data storage",
          "Data encryption",
          "Data transmission"
        ],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: "What is R primarily used for?",
        options: [
          "Web development",
          "Data analysis",
          "System programming",
          "Network security"
        ],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: "Which package in R is used for data visualization?",
        options: ["dplyr", "ggplot2", "tidyr", "shiny"],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: "What is a data frame in R?",
        options: [
          "A type of plot",
          "A matrix",
          "A table of data",
          "A function"
        ],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: "What is the function to read a CSV file in R?",
        options: ["read.csv()", "read.table()", "read.xlsx()", "import.csv()"],
        correctAnswerIndex: 0,
      ),
    ],
  ),
  Course(
    title: "Mobile App Development with Flutter",
    points: "150",
    duration: "7 days",
    thumbnail:
        "https://cdn.prod.website-files.com/5f841209f4e71b2d70034471/60bb4a2e143f632da3e56aea_Flutter%20app%20development%20(2).png",
    ratings: 4.9,
    enrollments: 1800,
    about:
        "Learn to build cross-platform mobile applications using Google's Flutter framework.",
    sections: [
      Section(
          title: "Introduction to Flutter",
          readingMaterial:
              "Flutter is an open-source UI toolkit for building natively compiled applications..."),
      Section(
          title: "Dart Programming Basics",
          readingMaterial:
              "Dart is the programming language used to build Flutter apps..."),
      Section(
          title: "Building Layouts in Flutter",
          readingMaterial:
              "Flutter provides a wide range of widgets for creating responsive and flexible layouts..."),
    ],
    quiz: [
      Question(
        questionText: "What is Flutter?",
        options: [
          "A UI toolkit",
          "A database",
          "A programming language",
          "A cloud service"
        ],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: "What language is used to write Flutter apps?",
        options: ["Java", "Kotlin", "Dart", "Swift"],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: "Which widget is used for creating a scrollable list?",
        options: ["ListView", "Column", "Row", "Stack"],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: "Which command is used to create a new Flutter project?",
        options: [
          "flutter create",
          "flutter init",
          "flutter new",
          "flutter build"
        ],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: "What is the use of setState() in Flutter?",
        options: [
          "Updates the UI",
          "Creates a new state",
          "Builds a new widget",
          "Destroys a widget"
        ],
        correctAnswerIndex: 0,
      ),
    ],
  ),
  Course(
    title: "Cloud Computing with AWS",
    points: "140",
    duration: "6 days",
    thumbnail:
        "https://platinumdatarecovery.com/wp-content/uploads/2023/05/cloud-computing-diagram.webp",
    ratings: 4.8,
    enrollments: 1300,
    about:
        "Master the fundamentals of cloud computing and AWS services to deploy scalable applications.",
    sections: [
      Section(
          title: "Introduction to Cloud Computing",
          readingMaterial:
              "Cloud computing is the delivery of computing services over the internet..."),
      Section(
          title: "AWS Core Services",
          readingMaterial:
              "Amazon Web Services (AWS) offers a broad range of cloud services..."),
      Section(
          title: "Deploying Applications on AWS",
          readingMaterial:
              "AWS provides tools and services to deploy and manage applications in the cloud..."),
    ],
    quiz: [
      Question(
        questionText: "What is cloud computing?",
        options: [
          "Storing data locally",
          "Delivering computing services over the internet",
          "Building private networks",
          "None of the above"
        ],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: "Which of the following is an AWS core service?",
        options: ["EC2", "S3", "RDS", "All of the above"],
        correctAnswerIndex: 3,
      ),
      Question(
        questionText: "What does EC2 stand for?",
        options: [
          "Elastic Compute Cloud",
          "Elastic Cloud Compute",
          "Elastic Cloud Configuration",
          "None of the above"
        ],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: "Which service is used for object storage in AWS?",
        options: ["S3", "EC2", "RDS", "DynamoDB"],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: "What is the use of AWS Lambda?",
        options: [
          "Run code without provisioning servers",
          "Store files",
          "Manage databases",
          "None of the above"
        ],
        correctAnswerIndex: 0,
      ),
    ],
  ),
  Course(
    title: "Introduction to Artificial Intelligence",
    points: "160",
    duration: "9 days",
    thumbnail:
        "https://datascientest.com/en/files/2021/01/Machine-learning-def-.png",
    ratings: 4.9,
    enrollments: 2100,
    about:
        "Explore the fundamentals of artificial intelligence, including machine learning, neural networks, and deep learning.",
    sections: [
      Section(
          title: "What is Artificial Intelligence?",
          readingMaterial:
              "Artificial Intelligence is the simulation of human intelligence in machines..."),
      Section(
          title: "Machine Learning vs AI",
          readingMaterial:
              "Machine learning is a subset of AI that focuses on building algorithms that can learn from data..."),
      Section(
          title: "Neural Networks",
          readingMaterial:
              "Neural networks are a series of algorithms that attempt to recognize underlying relationships in data..."),
    ],
    quiz: [
      Question(
        questionText: "What is Artificial Intelligence?",
        options: [
          "Simulating human intelligence in machines",
          "Building robots",
          "Programming languages",
          "All of the above"
        ],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: "What is a subset of AI?",
        options: [
          "Machine Learning",
          "Cybersecurity",
          "Cloud Computing",
          "Blockchain"
        ],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: "What are neural networks?",
        options: [
          "A series of algorithms",
          "A type of hardware",
          "A programming language",
          "None of the above"
        ],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: "Which of the following is a use case of AI?",
        options: [
          "Image recognition",
          "Speech recognition",
          "Recommendation systems",
          "All of the above"
        ],
        correctAnswerIndex: 3,
      ),
      Question(
        questionText: "What is deep learning?",
        options: [
          "A subset of machine learning",
          "A type of neural network",
          "A programming language",
          "Both 1 and 2"
        ],
        correctAnswerIndex: 3,
      ),
    ],
  ),
  Course(
      title: "DevOps for Beginners",
      points: "90",
      duration: "6 days",
      thumbnail:
          "https://miro.medium.com/v2/resize:fit:1400/1*h5Zs-8nFcTrgR1UceyKYXA.png",
      ratings: 4.6,
      enrollments: 1100,
      about:
          "Learn the principles of DevOps, including CI/CD pipelines, automation, and infrastructure as code.",
      sections: [
        Section(
            title: "What is DevOps?",
            readingMaterial:
                "DevOps is a set of practices that combines software development (Dev) and IT operations (Ops)..."),
        Section(
            title: "CI/CD Pipelines",
            readingMaterial:
                "Continuous Integration and Continuous Deployment are practices that involve automatically building, testing, and deploying code..."),
        Section(
            title: "Infrastructure as Code",
            readingMaterial:
                "Infrastructure as Code (IaC) is the process of managing and provisioning computing infrastructure through machine-readable configuration files..."),
      ],
      quiz: [
        Question(
          questionText: "What does DevOps stand for?",
          options: [
            "Development and Operations",
            "Developer Operations",
            "Development Optimized",
            "None of the above"
          ],
          correctAnswerIndex: 0,
        ),
        Question(
          questionText: "What is a CI/CD pipeline?",
          options: [
            "A process for automatic code deployment",
            "A type of software",
            "A network protocol",
            "A programming language"
          ],
          correctAnswerIndex: 0,
        ),
        Question(
          questionText: "What is Infrastructure as Code (IaC)?",
          options: [
            "Managing infrastructure through code",
            "Coding infrastructure components",
            "Programming networks",
            "None of the above"
          ],
          correctAnswerIndex: 0,
        ),
        Question(
          questionText: "Which tool is commonly used in DevOps for CI/CD?",
          options: ["Jenkins", "Docker", "Kubernetes", "All of the above"],
          correctAnswerIndex: 3,
        ),
      ])
];
