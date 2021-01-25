window.onload = function() {
    let filter = document.getElementsByClassName("level")
    for(let i=0;i<filter.length;i++){
        filter[i].addEventListener('click',function(){
            for(let j=0;j<filter.length;j++){
                if(i!=j){
                    filter[j].style.color = "rgba(0, 0, 0, 0.56)"
                }else {
                    filter[j].style.color = "#ff0006"

                }
            }
        })
    }
    let filter2 = document.getElementsByClassName("area")
    for(let i=0;i<filter2.length;i++){
        filter2[i].addEventListener('click',function(){
            for(let j=0;j<filter2.length;j++){
                if(i!=j){
                    filter2[j].style.color = "rgba(0, 0, 0, 0.56)"
                }else {
                    filter2[j].style.color = "#ff0006"

                }
            }
        })
    }
};
function hospitalDetailM(hostpital) {
    window.location.href="queryHospitalByID?hospitalID="+hostpital+"&current=1"
}
