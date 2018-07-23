// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// $(document).ready(function () {

  // // 上传礼物照片
  // $('#upload_gift_images').fileupload({
  //   dataType: 'json',
  //   type: "post",
  //   beforeSend: function () {
  //     $('#upload_gift_images_btn').html("上传中");
  //   },
  //   done: function (e, data) {
  //     if (data.result.status == "ok") {
  //       $('#upload_gift_images_btn').html("上传完成");
  //       $("#upload_gift_images_notice").html(data.result.message).removeClass("hidden");
  //       location.reload();
  //     }
  //   },
  //   error: function (XMLHttpRequest, textStatus, errorThrown) {
  //     if (textStatus == "error" && errorThrown == "Unprocessable Entity") {
  //       $('#upload_gift_images_btn').html("上传完成");
  //       $("#upload_gift_images_notice").html("文件类型错误").removeClass("hidden");
  //     }
  //   }
  // });
// });

/*
先在js里扩展一个uploadPreview方法
使用方法: 
<div>
<img id="ImgPr" width="120" height="120" /></div>
<input type="file" id="up" />
把需要进行预览的IMG标签外 套一个DIV 然后给上传控件ID给予uploadPreview事件
$("#up").uploadPreview({ Img: "ImgPr", Width: 120, Height: 120, ImgType: ["gif", "jpeg", "jpg", "bmp", "png"], Callback: function () { }});
*/
jQuery.fn.extend({
  uploadPreview: function (opts) {
    var _self = this,
      _this = $(this);
    opts = jQuery.extend({
      Img: "ImgPr",
      Width: 100,
      Height: 100,
      ImgType: ["gif", "jpeg", "jpg", "bmp", "png"],
      Callback: function () { }
    }, opts || {});
    _self.getObjectURL = function (file) {
      var url = null;
      if (window.createObjectURL != undefined) {
        url = window.createObjectURL(file)
      } else if (window.URL != undefined) {
        url = window.URL.createObjectURL(file)
      } else if (window.webkitURL != undefined) {
        url = window.webkitURL.createObjectURL(file)
      }
      return url
    };
    _this.change(function () {
      if (this.value) {
        if (!RegExp("\.(" + opts.ImgType.join("|") + ")$", "i").test(this.value.toLowerCase())) {
          alert("选择文件错误,图片类型必须是" + opts.ImgType.join("，") + "中的一种");
          this.value = "";
          return false
        }
        $("#" + opts.Img).attr('src', _self.getObjectURL(this.files[0]))
        opts.Callback()
      }
    })
  }
});