// DOM読み込みが完了したら実行
document.addEventListener('DOMContentLoaded', (e) => {
  // payjp.jsの初期化
 
  Payjp.setPublicKey('pk_test_a4f2b232e8c3b15c9c648b03');
  
  // ボタンのイベントハンドリング
  const submit = document.getElementById('card_submit');
  // アロー関数を設定する方法
 
  submit.addEventListener('click', (e) => {
    e.preventDefault();

    // カード情報生成
    const card = {
      number: document.getElementById('number').value,
      cvc: document.getElementById('cvc').value,
      exp_month: document.getElementById('exp_month').value,
      exp_year: 20 + document.getElementById('exp_year').value
    };

    // トークン生成
    Payjp.createToken(card, (status, response) => {
      console.log(card)
      console.log(response)
      if (status === 200) {
        // 出力（本来はサーバへ送信）
        $("#number").removeAttr("name");
        $("#cvc").removeAttr("name");
        $("#exp_month").removeAttr("name");
        $("#exp_year").removeAttr("name"); 
        // name属性を削除することにより、dataベースに送るのを防ぐ。
        $("#card_token").append($('<input type="hidden" name="payjp-token">').val(response.id)); 
        $("#card_token").submit();
      } else {
        alert("カード情報が正しくありません。");
      }
    });
  });
}, 
false);