// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 < 0.9.0;

contract CourseEnrollment {
    // Struct to represent a course
    struct Course {
        uint256 id;            // Unique course ID
        string name;           // Course name
        uint256 tokenReward;   // Token reward for completing the course
        bool exists;           // Flag to check if the course exists
    }

    // Struct to represent a student
    struct Student {
        mapping(uint256 => bool) enrolledCourses;   // Mapping of course ID to enrollment status
        mapping(uint256 => bool) completedCourses;  // Mapping of course ID to completion status
    }

    address public owner;                      // Address of the contract owner
    address public admin;                      // Address of the admin
    uint256 public nextCourseId;               // ID for the next course to be created
    mapping(uint256 => Course) public courses; // Mapping of course ID to Course struct
    mapping(address => Student) private students; // Mapping of student address to Student struct
    mapping(address => uint256) public tokenBalances; // Mapping of student address to token balance

    // Events to log actions
    event CourseCreated(uint256 indexed courseId, string name, uint256 tokenReward); // Event for course creation
    event StudentEnrolled(address indexed student, uint256 indexed courseId);         // Event for student enrollment
    event CourseCompleted(address indexed student, uint256 indexed courseId, uint256 reward); // Event for course completion
    event AdminChanged(address indexed oldAdmin, address indexed newAdmin); // Event for changing admin

    // Modifier to restrict function access to only the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function.");
        _;
    }

    // Modifier to restrict function access to only the admin
    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can call this function.");
        _;
    }

    // Modifier to check if a student is enrolled in a specific course
    modifier onlyEnrolled(uint256 _courseId) {
        require(courses[_courseId].exists, "Course does not exist.");
        require(students[msg.sender].enrolledCourses[_courseId], "Student not enrolled in the course.");
        _;
    }

    // Constructor to set the initial owner and course ID
    constructor() {
        owner = msg.sender;
        nextCourseId = 1;
    }

    // Function to change the admin (only callable by the owner)
    function changeAdmin(address _newAdmin) public onlyOwner {
        address oldAdmin = admin;
        admin = _newAdmin;
        emit AdminChanged(oldAdmin, _newAdmin);
    }

    // Function to create a new course (only callable by the owner or admin)
    function createCourse(string memory _name, uint256 _tokenReward) public onlyAdmin {
        courses[nextCourseId] = Course(nextCourseId, _name, _tokenReward, true); // Create a new course
        emit CourseCreated(nextCourseId, _name, _tokenReward); // Emit an event for course creation
        nextCourseId++; // Increment the course ID for the next course
    }

    // Function for an admin to enroll a student in a course
    function enrollStudent(address _student, uint256 _courseId) public onlyAdmin {
        require(courses[_courseId].exists, "Course does not exist."); // Check if the course exists
        require(!students[_student].enrolledCourses[_courseId], "Student already enrolled in the course."); // Check if the student is already enrolled
        students[_student].enrolledCourses[_courseId] = true; // Enroll the student in the course
        emit StudentEnrolled(_student, _courseId); // Emit an event for student enrollment
    }

    // Function for a student to enroll themselves in a course
    function selfEnroll(uint256 _courseId) public {
        require(courses[_courseId].exists, "Course does not exist."); // Check if the course exists
        require(!students[msg.sender].enrolledCourses[_courseId], "Student already enrolled in the course."); // Check if the student is already enrolled
        students[msg.sender].enrolledCourses[_courseId] = true; // Enroll the student in the course
        emit StudentEnrolled(msg.sender, _courseId); // Emit an event for student enrollment
    }

    // Function for a student to complete a course (only callable if enrolled)
    function completeCourse(uint256 _courseId) public onlyEnrolled(_courseId) {
        require(!students[msg.sender].completedCourses[_courseId], "Course already completed."); // Check if the course is already completed
        students[msg.sender].completedCourses[_courseId] = true; // Mark the course as completed
        tokenBalances[msg.sender] += courses[_courseId].tokenReward; // Award tokens to the student
        emit CourseCompleted(msg.sender, _courseId, courses[_courseId].tokenReward); // Emit an event for course completion
    }

    // Function to get the token balance of a student
    function getTokenBalance(address _student) public view returns (uint256) {
        return tokenBalances[_student]; // Return the token balance of the student
    }

    // Function to check if a student is enrolled in a specific course
    function isEnrolled(address _student, uint256 _courseId) public view returns (bool) {
        return students[_student].enrolledCourses[_courseId]; // Return the enrollment status of the student
    }

    // Function to check if a student has completed a specific course
    function hasCompleted(address _student, uint256 _courseId) public view returns (bool) {
        return students[_student].completedCourses[_courseId]; // Return the completion status of the student
    }
}
