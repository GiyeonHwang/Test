<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String name = (String) request.getAttribute("name");
   
%>
<c:set var="session_userid" value="${id}"></c:set>
<html>
<head>
<script src="js/bootstrap.min.js"></script>
<title>Board</title>
</head>
<script type="text/javascript">
   function checkForm() {
      if (!document.newWrite.name.value) {
         alert("성명을 입력하세요.");
         return false;
      }
      if (!document.newWrite.subject.value) {
         alert("제목을 입력하세요.");
         return false;
      }
      if (!document.newWrite.content.value) {
         alert("내용을 입력하세요.");
         return false;
      }      
   }
   function goData() {
      var edit=document.getElementById('editor').innerHTML
      var form = document.newWrite;
      $('input[name=content]').attr('value', edit);
      console.log(edit)
      console.log(form)
   }
</script>
<body>
<jsp:include page="../Nav.jsp" />
   <div class="jumbotron">
      <div class="container">
         <h1 class="display-3">게시판</h1>
      </div>
   </div>

   <div class="container">
      <form name="newWrite" id="newWrite" action="./BoardWriteAction.do"
         class="form-horizontal" method="post" onsubmit="return checkForm()">
         <input type="hidden" value="" name="content">
         <input name="id" type="hidden" class="form-control"
            value="${session_userid}">
         <div class="form-group row">
            <label class="col-sm-2 control-label" >성명</label>
            <div class="col-sm-3">
               <input name="name" type="text" class="form-control" value="<%=name %>"
                  placeholder="name">
            </div>
         </div>
         <div class="form-group row">
            <label class="col-sm-2 control-label" >제목</label>
            <div class="col-sm-5">

               <input name="subject" type="text" class="form-control"
                  placeholder="subject">
            </div>
         </div>
          <div class="form-group row"> 
            <label class="col-sm-2 control-label" >내용</label>
            <div class="col-sm-8">
<!--                <textarea name="content" cols="50" rows="5" class="form-control" -->
<!--                   placeholder="content"></textarea> -->
               <div class="editor-menu">
                  <button type="button" id="btn-bold">
                     <b>B</b>
                  </button>
                  <button type="button" id="btn-italic">
                     <i>I</i>
                  </button>
                  <button type="button" id="btn-underline">
                     <u>U</u>
                  </button>
                  <button type="button" id="btn-strike">
                     <s>S</s>
                  </button>
                  <button type="button" id="btn-ordered-list">OL</button>
                  <button type="button" id="btn-unordered-list">UL</button>

            </div>
          </div>
         <div class="form-group row">
            <div class="col-sm-offset-2 col-sm-10 ">
             <input type="submit" class="btn btn-primary " value="등록 " onclick="goData();">            
                <input type="reset" class="btn btn-primary " value="취소 ">
            </div>
         </div>
      </form>
      <hr>
   </div>
</body>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
    const editor = document.getElementById('editor');
    const btnBold = document.getElementById('btn-bold');
    const btnItalic = document.getElementById('btn-italic');
    const btnUnderline = document.getElementById('btn-underline');
    const btnStrike = document.getElementById('btn-strike');
    const btnOrderedList = document.getElementById('btn-ordered-list');
    const btnUnorderedList = document.getElementById('btn-unordered-list');
    const btnImage = document.getElementById('btn-image');
    const imageSelector = document.getElementById('img-selector');
    
    
    btnBold.addEventListener('click', function () {
        setStyle('bold');
    });

    btnItalic.addEventListener('click', function () {
        setStyle('italic');
    });

    btnUnderline.addEventListener('click', function () {
        setStyle('underline');
    });

    btnStrike.addEventListener('click', function () {
        setStyle('strikeThrough')
    });

    btnOrderedList.addEventListener('click', function () {
        setStyle('insertOrderedList');
    });

    btnUnorderedList.addEventListener('click', function () {
        setStyle('insertUnorderedList');
    });

    btnImage.addEventListener('click', function () {
        imageSelector.click();
    });

    imageSelector.addEventListener('change', function (e) {
        const files = e.target.files;
        if (!!files) {
            insertImageDate(files[0]);
        }
    });
    
    editor.addEventListener('keydown', function () {
        checkStyle();
    });

    editor.addEventListener('mousedown', function () {
        checkStyle();
    });
    
    
    function setStyle(style) {
        document.execCommand(style);
        focusEditor();
        checkStyle();
    }
    
    function checkStyle() {
        if (isStyle('bold')) {
            btnBold.classList.add('active');
        } else {
            btnBold.classList.remove('active');
        }
        if (isStyle('italic')) {
            btnItalic.classList.add('active');
        } else {
            btnItalic.classList.remove('active');
        }
        if (isStyle('underline')) {
            btnUnderline.classList.add('active');
        } else {
            btnUnderline.classList.remove('active');
        }
        if (isStyle('strikeThrough')) {
            btnStrike.classList.add('active');
        } else {
            btnStrike.classList.remove('active');
        }
        if (isStyle('insertOrderedList')) {
            btnOrderedList.classList.add('active');
        } else {
            btnOrderedList.classList.remove('active');
        }
        if (isStyle('insertUnorderedList')) {
            btnUnorderedList.classList.add('active');
        } else {
            btnUnorderedList.classList.remove('active');
        }
    }

    function isStyle(style) {
        return document.queryCommandState(style);
    }

    // 버튼 클릭 시 에디터가 포커스를 잃기 때문에 다시 에디터에 포커스를 해줌
    function focusEditor() {
        editor.focus({preventScroll: true});
    }
    
    function insertImageDate(file) {
        const reader = new FileReader();
        reader.addEventListener('load', function (e) {
            focusEditor();
            document.execCommand('insertImage', false, `${reader.result}`);
        });
        reader.readAsDataURL(file);
    }
    
    <!-- <button type="button" id="btn-image">IMG</button> -->
    </div>
    <input id="img-selector" type="file" accept="image/*" onchange='openFile(event)' >
<!--       <img id='output'> -->
    <div id="editor" class=""  contenteditable="true" ><img id='output'></div>
<!-- <input id="img-selector" type="file" accept="image/*" onchange='openFile(event)' > -->
//     사진 업로드
//     var openFile = function(event) {
//         var input = event.target;

//         var reader = new FileReader();
//         reader.onload = function(){
//           var dataURL = reader.result;
//           var output = document.getElementById('output');
//           output.src = dataURL;
// //           var editor = document.getElementById('editor');
// //           editor.src = dataURL;
//         };
//         reader.readAsDataURL(input.files[0]);
//       };
</script>

</html>
<style>

div#editor {
   padding: 16px 24px;
   border: 1px solid #D6D6D6;
   border-radius: 4px;
}

#img-selector {
   display: none;
}

#editor img {
   max-width: 100%;
}

button.active {
   background-color: purple;
   color: #FFF;
}

</style>

