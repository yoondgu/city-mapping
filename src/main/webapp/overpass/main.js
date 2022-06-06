/**
 * 전국육교표준정보 json URL을 XMLHttpRequest 객체로 가져와서 파싱한다.
 * 파싱하면서 값들을 꺼내서 table태그의 자식태그들을 생성한다.
 */
 
 // 정확히 어떤 원리로 요청, 응답받는지 다시 이해해볼 것
let xhr = new XMLHttpRequest();
xhr.open("GET", "https://www.data.go.kr/download/15025444/standard.do?dataType=json", true);
xhr.onload = function() {
	
	if (this.status === 200) {
		data = JSON.parse(this.responseText);
		
		let fields = data.fields;
		let thRowEl = document.querySelector(".th-row");		
		for (let i = 0; i < fields.length; i++) {
			//console.log(fields[i].id);
			// 테이블헤더에 헤더 정보들을 th태그에 담아 tr태그 안에 넣는다.
			thRowEl.innerHTML += `<th id="${fields[i].id}}">${fields[i].id}</th>`;
			}
		
		let records = data.records;
		let tbEl = document.querySelector("#tb");		
		for (let i = 0; i < records.length; i++) { 
			// 육교정보 object를 불러온다.
			// 데이터가 너무 많으므로 소재지가 서울인 정보만 불러오도록 한다.
			let item = records[i];
			if (!item.소재지도로명주소.startsWith("서울")) {
				continue;
			}
			// console.log(i);
			// 각 object의 값들을 담을 tr태그를 생성한다. class명도 지정해준다.
			let tr = document.createElement('tr');
			tr.setAttribute("class","tb-row");
			// object의 모든 key의 값을 꺼내 td태그에 담아 tr태그 안에 넣는다.
			for (let key in item) {
				tr.innerHTML += `<td id="${i}-${key}">${item[key]}</td>`;
				tbEl.appendChild(tr);
			}
		}
	}
}

xhr.send();
