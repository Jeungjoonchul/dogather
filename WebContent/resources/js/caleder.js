let date = new Date();

const renderCalender = () => {
  const viewYear = date.getFullYear();
  const viewMonth = date.getMonth();

  document.querySelector('.year-month').textContent = `${viewYear}년 ${viewMonth + 1}월`;

  const prevLast = new Date(viewYear, viewMonth, 0);
  const thisLast = new Date(viewYear, viewMonth + 1, 0);

  const PLDate = prevLast.getDate();
  const PLDay = prevLast.getDay();

  const TLDate = thisLast.getDate();
  const TLDay = thisLast.getDay();

  const prevDates = [];
  const thisDates = [...Array(TLDate + 1).keys()].slice(1);
  const nextDates = [];

  if (PLDay !== 6) {
    for (let i = 0; i < PLDay + 1; i++) {
      prevDates.unshift(PLDate - i);
    }
  }

  for (let i = 1; i < 7 - TLDay; i++) {
    nextDates.push(i);
  }

  const dates = prevDates.concat(thisDates, nextDates);
  const firstDateIndex = dates.indexOf(1);
  const lastDateIndex = dates.lastIndexOf(TLDate);

  dates.forEach((date, i) => {
    const condition = i >= firstDateIndex && i < lastDateIndex + 1
                      ? 'this'
                      : 'other';
    dates[i] = `<div class="date"><span class="${condition} ${date} ">${date}</span></div>`;
  });

  document.querySelector('.dates').innerHTML = dates.join('');

  const today = new Date();
  if (viewMonth === today.getMonth() && viewYear === today.getFullYear()) {
    for (let date of document.querySelectorAll('.this')) {
      if (+date.innerText === today.getDate()) {
        date.classList.add('today');
        
        break;
      }
    }
  }
  /*if (viewMonth === today.getMonth() && viewYear === today.getFullYear()) {
    for (let date of document.querySelectorAll('.this')) {
      if (+date.innerText === 2) {
        date.innerHTML+="<br>추가됨";
        date.parentNode.classList.add('on');
        break;
      }
    }
  }*/
};

renderCalender();

const prevMonth = () => {
	var todayDate = new Date();
	date.setMonth(date.getMonth() - 1);
	var year = date.getFullYear();
	var month = date.getMonth()+1;
	var day = date.getDate();
	var dg_index=$('#dg_index').val();
	$.ajax({
		url : cp + '/dg/dg_get_certList.dg',
		type : 'post',
		data : {"dg_index":dg_index,"year":year,"month":month},
		dataType : 'json',
		async : false,
		success : function(data) {
			renderCalender();
			$('.this').parent().css("background-color","white");				
			if(todayDate.getFullYear()==year){
				if(todayDate.getMonth()+1>month){
					$('.this').parent().css("background-color","#ffcdd2");

				}else if(todayDate.getMonth()+1<month){

				}else{
					for (var i = 1; i <= todayDate.getDate(); i++) {
						$('.this.'+i).parent().css("background-color","#ffcdd2");	
					}

				}
			}
			
			for (var i = 0; i < data.cl.length; i++) {
				var d=data.cl[i].dp_reg_date.split(' ')[0];
				var dd=d.split('-')[2];
				dd=dd.indexOf(0)=='0'?dd.substring(1,2):dd;
				$('.this.'+dd).parent().css("background-color","#bbdefb");
			}
			
			var td_year=data.td.split('-')[0];
			var td_month=data.td.split('-')[1];
			var td_day=data.td.split('-')[2];
			td_day=td_day.indexOf(0)=='0'?td_day.substring(1,2):td_day;
			if(td_year==year&&td_month==month){
				$('.this.'+td_day).parent().append('<br><span class="purple">목표일</span>');
			}
		}
	});
  
};

const nextMonth = () => {
	var todayDate = new Date();
	date.setMonth(date.getMonth() + 1);
	var year = date.getFullYear();
	console.log(year);
	var month = date.getMonth()+1;
	console.log(month);
	var day = date.getDate();
	console.log(day);
	var dg_index=$('#dg_index').val();
  $.ajax({
		url : cp + '/dg/dg_get_certList.dg',
		type : 'post',
		data : {"dg_index":dg_index,"year":year,"month":month},
		dataType : 'json',
		async : false,
		success : function(data) {
			renderCalender();
			$('.this').parent().css("background-color","white");				
			if(todayDate.getFullYear()==year){
				if(todayDate.getMonth()+1>month){
					$('.this').parent().css("background-color","#ffcdd2");

				}else if(todayDate.getMonth()+1<month){

				}else{
					for (var i = 1; i <= todayDate.getDate(); i++) {
						$('.this.'+i).parent().css("background-color","#ffcdd2");	
					}

				}
			}
			
			for (var i = 0; i < data.cl.length; i++) {
				var d=data.cl[i].dp_reg_date.split(' ')[0];
				var dd=d.split('-')[2];
				dd=dd.indexOf(0)=='0'?dd.substring(1,2):dd;
				$('.this.'+dd).parent().css("background-color","#bbdefb");
			}
			
			var td_year=data.td.split('-')[0];
			var td_month=data.td.split('-')[1];
			var td_day=data.td.split('-')[2];
			td_day=td_day.indexOf(0)=='0'?td_day.substring(1,2):td_day;
			if(td_year==year&&td_month==month){
				$('.this.'+td_day).parent().append('<br><span class="purple">목표일</span>');
			}
		}
	});
  
};

const goToday = () => {
  date = new Date();
  var year = date.getFullYear();
  var month = date.getMonth()+1;
  var day=date.getDate();
  var dg_index=$('#dg_index').val();
  $.ajax({
		url : cp + '/dg/dg_get_certList.dg',
		type : 'post',
		data : {"dg_index":dg_index,"year":year,"month":month},
		dataType : 'json',
		async : false,
		success : function(data) {
			renderCalender();
				$('.this').parent().css("background-color","white");	
				for (var i = 1; i <= date.getDate(); i++) {
					$('.this.'+i).parent().css("background-color","#ffcdd2");	
				}
			
				for (var i = 0; i < data.cl.length; i++) {
					var d=data.cl[i].dp_reg_date.split(' ')[0];
					var dd=d.split('-')[2];
					dd=dd.indexOf(0)=='0'?dd.substring(1,2):dd;
					$('.this.'+dd).parent().css("background-color","#bbdefb");
				}
				
				var td_year=data.td.split('-')[0];
				var td_month=data.td.split('-')[1];
				var td_day=data.td.split('-')[2];
				td_day=td_day.indexOf(0)=='0'?td_day.substring(1,2):td_day;
				if(td_year==year&&td_month==month){
					$('.this.'+td_day).parent().append('<br><span class="purple">목표일</span>');
				}
		}
	});
  
};