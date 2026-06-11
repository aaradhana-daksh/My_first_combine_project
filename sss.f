let select=document.querySelector(".select-heading")
let arrow=document.querySelector(".select-heading img")
let options=document.querySelector(".options")
let option=document.querySelectorAll(".option")
let selecttext=document.querySelector(".select-heading span")


select.addEventListener("click",()=>{
    options.classList.toggle("active-options")
    arrow.classList.toggle("rotate")

})

option.forEach((item)=>{
    item.addEventListener("click",()=>{
    selecttext.innerText=item.innerText
    })
})

// chat bot 

let prompt=document.querySelector(".prompt")
let chatbtn=document.querySelector(".input-area button")
let chatContainer=document.querySelector(".chat-container")
let h1=document.querySelector(".h1")
let chatimg=document.querySelector("#chatbotimg")
let chatbox=document.querySelector(".chat-box")

let userMessage="";

chatimg.addEventListener("click",()=>{
    chatbox.classList.toggle("active-chat-box")
    
        if(chatbox.classList.contains("active-chat-box")){
            chatimg.src="cross.svg"
        }else{
             chatimg.src="chatbot.svg"
        }
    

})


let Api_url="https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=AIzaSyDzyluvFgnQ1cODeFxX_ZaXeYBvcFyQRRY"



async function generateApiResponse(aiChatBox){
    const textElement=aiChatBox.querySelector(".text")
    try{
    const response=await fetch(Api_url,{     
      method:"POST",
      headers:{"Content-Type": "application/json"},
      body:JSON.stringify({
        contents:[{
          "role": "user",
          "parts":[{text:`${userMessage} in 10 words`}]
        }]
      })
    })
    const data=await response.json()
    const apiResponse=data?.candidates[0].content.parts[0].text.trim();
    textElement.innerText=apiResponse }

    catch(error){
      console.log(error)
    }
    finally{
      aiChatBox.querySelector(".loading").style.display="none"
    }
    }


function creatChatBox(html,className){
    const div=document.createElement("div")
    div.classList.add(className)
    div.innerHTML=html;
    return div

}

function showLoading(){
    const html=`<p class="text"></p>
    <img src="load.gif" class="loading" width="50px">`
      let aiChatBox= creatChatBox(html,"ai-chat-box")
   chatContainer.appendChild(aiChatBox)
  generateApiResponse(aiChatBox)
  
  }

chatbtn.addEventListener("click",()=>{
    h1.style.display="none"
    userMessage=prompt.value;
   

const html =`  <p class= "text"> </p>`
        
                let userChatBox=creatChatBox(html,"user-chat-box")
                userChatBox.querySelector(".text").innerText=userMessage
                chatContainer.appendChild(userChatBox)
                prompt.value=""
                setTimeout(showLoading,500)

})

    // virtual Assistant

let ai=document.querySelector(".virtual-assistant img")
let speakpage=document.querySelector(".speak-page")
let content=document.querySelector(".speak-page h1")




function speak(text){
    let text_speak=new SpeechSynthesisUtterance(text)
    text_speak.rate=1
    text_speak.pitch=1
    text_speak.volume=1
    text_speak.lang="hi-GB"
    window.speechSynthesis.speak(text_speak)
  }

 
const SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;
const recognition=new SpeechRecognition()

recognition.onresult=(event)=>{
   speakpage.style.display="none"
  
    let currentIndex=event.resultIndex
    let transcript=event.results[currentIndex][0].transcript
    content.innerText=transcript
  takeCommand(transcript.toLowerCase())
   
  
}
function takeCommand(message){
  if(message.includes("open chatgpt") && message.includes("chatgpt")){
    speak("okay sir,  maam")
    chatbox.classList.add("active-chat-box")
  }
  else if(message.includes("close chatgpt") && message.includes("chatgpt")){
    speak("okay sir or  maam")
    chatbox.classList.remove("active-chat-box")}
  else if (message.includes("hello")){
    speak("hello  sir or  maam ,...........what can i help you ")
  }
  
  
  
  else if(message.includes("back")){
    speak("okay sir, maam")
    window.open("back.html","_self")

  }else if(message.includes("chest")){
    speak("okay sir or maam")
    window.open("chest.html","_self")
  }
  else if(message.includes(" biceps workout")|| message.includes("triceps")){
    speak("okay sir ,  maam")
    window.open("biceps-triceps.html","_self")
  }else if(message.includes(" open shoulder workout")){
    speak("okay sir or  maam")
    window.open("shoulder.html","_self")
  }else if(message.includes(" open leg workout")){
    speak("okay sir or  maam")
    window.open("leg.html","_self")}
    else if(message.includes("home")){
      speak("okay sir or  maam")
      window.open("fitness.html","_self")
    }else if(message.includes("hello")||message.includes("hey")){
      speak("hello sir or  maam,what can i help you?")
    }else if(message.includes("who are you")){
      speak("i am jojo ... means ai virtual assistant or digital assistant,.....created by aaradhana maam , Aayush sir and vishvjeet sir ,....,....i am a group project in  bca final year in shobhit university ......,,,,.... for  my developer....my boss ....aaradhana maam , aayush sir and vishvjeet sir .........in this project .....,,,, ai assistent .....idea by aaradhana maam ....and style by aayush and vishvjeet sir ..you can asked any think what you want ...............thank you sir aur maam..............for asking me ")}
  else if(message.includes("open youtube")){
    speak("opening youtube...")
    window.open("https://youtube.com/","_blank")
  }
  else if(message.includes("open google")){
    speak("opening google...")
    window.open("https://google.com/","_blank")
  }
  else if(message.includes("open facebook")){
    speak("opening facebook...")
    window.open("https://facebook.com/","_blank")
  }
  else if(message.includes("open instagram")){
    speak("opening instagram...")
    window.open("https://instagram.com/","_blank")
  }
  else if(message.includes("open calculator")){
    speak("opening calculator..")
    window.open("calculator://")
  }
  else if(message.includes("open whatsapp")){
    speak("opening whatsapp..")
    window.open("whatsapp://")
  }
  else if(message.includes("time")){
  let time=new Date().toLocaleString(undefined,{hour:"numeric",minute:"numeric"})
  speak(time)
  }
  else if(message.includes("date")){
    let date=new Date().toLocaleString(undefined,{day:"numeric",month:"short"})
    speak(date)
  }
  else{
    let finalText="this is what i found on internet regarding" + message.replace("AARU","") || message.replace("AARU","")
    speak(finalText)
    window.open(`https://www.google.com/search?q=${message.replace("AARU","")}`,"_blank")
  }


}


ai.addEventListener("click",()=>{
    recognition.start()
    speakpage.style.display="flex";
})


