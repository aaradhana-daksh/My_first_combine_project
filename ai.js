

//let btn=document.querySelector(".btn")
//let content=document.querySelector("content")


function speak(text){
    let text_speak=new SpeechSynthesisUtterance(text)
    text_speak.rate=1;
    text_speak.pitch=1;
    text_speak.volume=1;
    text_speak.lang="hi-GB"
    window.speechSynthesis.speak(text_speak)
}

function wishMe(){
    let day=new Date()
    let Hours= day.getHours()
    
if( Hours>=0 && Hours<12){
    speak("good morning maam, How can i help you !")

}
else if(Hours>=12 && Hours <16){
speak("good  afternoon maam, How can i help you !")
}

else{
speak("good evening maam , How can i help you !")
}
}

window.addEventListener('load',()=>{
wishMe()

})


const SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;
if (!SpeechRecognition) {
    alert("Your browser does not support Speech Recognition.");
} else {
    const recognition = new SpeechRecognition();
    recognition.lang = 'en-GB';
    recognition.interimResults = false;
    recognition.maxAlternatives = 1;

    const startBtn = document.getElementById('start-btn');
    const result = document.getElementById('result');
    const voice  = document.getElementById('voice');

   /// startBtn.onclick = () => {
       // recognition.start();
   // };

   let transcript = 'result';
   recognition.onresult = (event) => {
    let currentIndex= event.resultIndex
      let  transcript = event.results[currentIndex][0].transcript;
       result.innerText=transcript
       takeCommand(transcript.toLowerCase());
   };
   

        
        
    

    startBtn.addEventListener("click",()=>{
        recognition.start()
        startBtn.style.display="none"
        voice.style.display="block"
    })


    function takeCommand(message) {
        startBtn.style.display="flex"
        voice.style.display="none"

     if(message.includes("hello") || message.includes("hi") ){
        speak("hey maam aur sir , how can i help you i am you friend ?");
     }
     else if(message.includes("who are you?")){
        speak("i am your virtual assistant, created by AARADHANA MAAM !");
     }
     else if(message.includes("youtube")){
        speak("opening youtube......");
        window.open("https://youtube.com/","_blank");
     }
     
     else if(message.includes("open google")){
        speak("opening google......");
        window.open("https://google.com/","_blank");
    }
    else if(message.includes("open facebook")){
        speak("opening facebook.....");
        window.open("https://facebook.com/","_blank");


    }
    else if(message.includes("open google")){
        speak("opening google......");
        window.open("https://google.com/","_blank");
    }
    else if(message.includes("open firebox")){
        speak("opening firebox.....");
        window.open("https://firebox.com/","_blank");


}
else if(message.includes("open google")){
    speak("opening google......");
    window.open("https://google.com/","_blank");
}
else if(message.includes("open instagram")){
    speak("opening instagram.....");
    window.open("https://instagram.com/","_blank");


}else if(message.includes("open calculator")){
    speak("opening calculator.....");
    window.open("calculator://");}

    else if(message.includes("open whatsapp")){
        speak("opening  whatsapp.....");
        window.open("https:// whatsapp.com/","_blank");}


        else if( message.includes("time")){
            let time=new Date().toLocaleString(undefined,{hour:"numeric",minute: "numeric"})
            speak(time)
        }
        
    else if(message.includes("open my university ")){
        speak("opening  university.....");
        window.open("https://www.google.com/search?q=shobhit+university+gangoh&client=firefox-b-d&sca_esv=e1edc051017ec775&sxsrf=ADLYWIJmO5ngHOScoZvH66Lof6R9UzwfqQ%3A1731238641285&ei=8ZowZ4qCEZCuseMPgODJsQc&gs_ssp=eJzj4tVP1zc0zDBKT8suqMo2YLRSNagwtjRItbA0NDdMSzMxN7U0twIKmSQlpqWlGBgmWxgZmBtZeEkWZ-QnZWSWKJTmZZalFhVnllQqpCfmpednAAC8WBkq&oq=shobhit+university+&gs_lp=Egxnd3Mtd2l6LXNlcnAiE3Nob2JoaXQgdW5pdmVyc2l0eSAqAggAMhAQLhiABBhDGMcBGIoFGK8BMgoQLhiABBgUGIcCMgoQABiABBhDGIoFMgoQABiABBhDGIoFMgUQABiABDIKEAAYgAQYQxiKBTIKEAAYgAQYQxiKBTIFEAAYgAQyBRAAGIAEMgUQABiABDIfEC4YgAQYQxjHARiKBRivARiXBRjcBBjeBBjgBNgBAUivWFDBCVjBCXAAeAKQAQCYAfEDoAHxA6oBAzQtMbgBAcgBAPgBAZgCA6ACqkzCAgQQABhHmAMAiAYBkAYIugYGCAEQARgUkgcJMS40LTEuOS0xoAe0DA&sclient=gws-wiz-serp","_blank");}


        

        
    
    

else{

    speak(`this is what i found on internet regarding  ${message}`)
    window.open(`https://www.google.com/search?q=${message}`)
}
}
}

