# 학습목표

1. SPM 활용
2. Package를 포함하는 프로젝트
3. 기본적인 웹 크롤링

# 1. SPM 활용

Pacakge 추가 및 import
<p align="center">
    <img width="472" alt="image" src="https://github.com/SungMinCho-Kor/Crawling/assets/128480641/a36a22d4-7369-4dea-92bd-b332e87214f2">
    <img width="1146" alt="image" src="https://github.com/SungMinCho-Kor/Crawling/assets/128480641/0718c608-fbc0-4b71-b1e5-02e2384036ee">
    <img width="697" alt="image" src="https://github.com/SungMinCho-Kor/Crawling/assets/128480641/18b36122-ca20-4e44-b122-a1f4edc4fc3a">
</p>

# 2. Local SPM
Local Package 생성
<p align="center">
    <img width="442" alt="image" src="https://github.com/SungMinCho-Kor/Crawling/assets/128480641/dfdfab8b-93a1-4aa4-a7db-fc6b686ddd59">
</p>

`Package.swift` 파일 수정
<img width="630" alt="image" src="https://github.com/SungMinCho-Kor/Crawling/assets/128480641/62952ff5-4c94-4082-9efc-943307a197e2">
`build` 해서 `SwiftSoup` 추가 확인
<img width="733" alt="image" src="https://github.com/SungMinCho-Kor/Crawling/assets/128480641/a25fdca0-c648-46c9-9954-d37d5cfb1ede">
Local Package 추가하기
<img width="427" alt="image" src="https://github.com/SungMinCho-Kor/Crawling/assets/128480641/da20c535-6f08-423d-a232-a5379b6b8a36">
<img width="1146" alt="image" src="https://github.com/SungMinCho-Kor/Crawling/assets/128480641/d91de930-8585-4b1d-872f-c0d51f3bba9e">
`Add Local...` 버튼 클릭
<img width="1146" alt="image" src="https://github.com/SungMinCho-Kor/Crawling/assets/128480641/8cc5cc52-3e9a-4e38-a6a9-f0c10b710d43">
<img width="267" alt="image" src="https://github.com/SungMinCho-Kor/Crawling/assets/128480641/bfa9883f-2aa7-4425-853b-db45aa25fd09">
프로젝트 Target과 Local Package 연결
<img width="676" alt="image" src="https://github.com/SungMinCho-Kor/Crawling/assets/128480641/64f6fea1-b74b-41c8-85c4-5a475d811fc5">
<img width="403" alt="image" src="https://github.com/SungMinCho-Kor/Crawling/assets/128480641/40228a62-2bd2-4c93-9570-d69fd51ec80b">
<img width="684" alt="image" src="https://github.com/SungMinCho-Kor/Crawling/assets/128480641/7c8200d0-2761-43d7-ba6b-342df71ecf11">
# 3. 기본적인 웹 크롤링

재학중인 대학교 학사 공지사항 게시판을 크롤링
http://board.sejong.ac.kr/boardlist.do?bbsConfigFK=335

<p align="center">
    <img width="912" alt="image" src="https://github.com/SungMinCho-Kor/Crawling/assets/128480641/3576264d-2db1-492a-8d04-2440a79fc3d0">
</p>

1. URL 설정
```swift
    guard let url = URL(string: "http://board.sejong.ac.kr/boardlist.do?bbsConfigFK=335") else{ throw Errors.urlError }
    let html = try String(contentsOf: url, encoding: .utf8)
```

2. Parsing

Parsing 하고자하는 곳에 검사를 눌러 Selector 복사를 이용하면 쉽게 Select 할 태그를 얻을 수 있다.
<p align="center">
    <img width="831" alt="image" src="https://github.com/SungMinCho-Kor/Crawling/assets/128480641/0997ad20-abd3-4a3f-b9e9-9b46962dd2eb">
    <img width="818" alt="image" src="https://github.com/SungMinCho-Kor/Crawling/assets/128480641/977aa4a7-1abf-4c3b-b234-b568b6fdbcd7">
    <img width="460" alt="image" src="https://github.com/SungMinCho-Kor/Crawling/assets/128480641/7899e07a-904c-4ac7-b194-e89241c515ed">
</p>

복사 결과 : `body > div.board-table.list > table > tbody > tr:nth-child(1)`

tr 모두를 가져오면 되므로 select에서 `tr`까지 작성

```swift
    let contents : Document = try SwiftSoup.parse(html)
    let lines = try contents.select("body > div.board-table.list > table > tbody > tr")
```

3. 출력

```swift
    for line in lines{
        try print(line.text())
    }
```
<p align="center">
    <img width="660" alt="image" src="https://github.com/SungMinCho-Kor/Crawling/assets/128480641/c76b108d-ad12-4562-8d5e-12fd9ac3c31c">
</p>
