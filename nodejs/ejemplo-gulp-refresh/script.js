document.querySelector('h1').style.color = 'blue';

function clickeame(){
    document.getElementById('btn').style.display = 'none';

    var texto="<img src='src/family.jpg' alt='Imagen' style='width: 70%; height: 40%;'/>";
    document.writeln(texto);
    
    var texto_audio = "<audio src='src/te-quiero-yo.mp3' autoplay></audio>";
    
    document.writeln(texto_audio);
}