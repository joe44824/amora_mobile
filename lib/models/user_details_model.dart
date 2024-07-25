class UserDetail {
  final String name;
  final int age;
  final bool isVerified;
  final String city;
  final String country;
  final List<String> imageUrls;
  final String about;

  UserDetail(
      {required this.name,
      required this.age,
      required this.isVerified,
      required this.city,
      required this.country,
      required this.imageUrls,
      this.about = ""});
}

List<UserDetail> usersInfo = [
  UserDetail(
      name: "Natalie Chee",
      age: 23,
      isVerified: true,
      city: "Central",
      country: "Singapore",
      imageUrls: [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuYo9dvomzXAgGWoCsl63Eyy2aGoiRnvk6mtX_uzx0DMEtNXam9c69USxqRc0obxVMI-I&usqp=CAU",
        "https://pbs.twimg.com/media/Ezoj3mHUYAMdKSV?format=jpg&name=large",
        "https://i.ebayimg.com/images/g/C7AAAOSw8p9i8C7Q/s-l1200.webp"
      ],
      about:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  UserDetail(
      name: "Vanessa Kirby",
      age: 28,
      isVerified: true,
      city: "Atlanta",
      country: "US",
      imageUrls: [
        "https://m.media-amazon.com/images/M/MV5BY2JlNmZhMDgtYzlkYy00OWFkLTk4MzItNjMzYjBkNWVkZTk4XkEyXkFqcGdeQXVyMjQwMDg0Ng@@._V1_.jpg",
        "https://ew.com/thmb/KVlDHeTrbNDzQAswqs3ESoRFBbU=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/mdj-03479r-pk-2000-8efc54fb89b34dc98766c652135fcca9.jpg",
        "https://i.pinimg.com/736x/77/40/f1/7740f1c0060e7370ee075283995bcb32.jpg"
      ],
      about:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  UserDetail(
      name: "Ema Kisaki",
      age: 34,
      isVerified: true,
      city: "Tokyo",
      country: "Japan",
      imageUrls: [
        "https://mblogthumb-phinf.pstatic.net/MjAxNjExMTFfNjgg/MDAxNDc4ODcyODQwODgy.zaIe0VtOQ3ecGe63pgkKegA8fhl0J_uB8WyGrarE2Hwg.B6EyASIFeQHtBFAhjjdHQPHwzZAtlPkd_mWUfpyN1z4g.JPEG.world199/038_7.jpg?type=w800",
        "https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F9918D63A5B48A5D330",
        "https://img1.daumcdn.net/thumb/R720x0.q80/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F99EBAC335A010C6720"
      ],
      about:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
];
