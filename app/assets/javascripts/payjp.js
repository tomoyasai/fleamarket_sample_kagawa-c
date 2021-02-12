// DOM読み込みが完了したら実行
document.addEventListener('DOMContentLoaded', (e) => {
  // payjp.jsの初期化
  Payjp.setPublicKey('pk_test_a4f2b232e8c3b15c9c648b03');
  
  // ボタンのイベントハンドリング
  const btn = document.getElementById('card_submit');
  // アロー関数を設定する方法
  btn.addEventListener('click', (e) => {
    console.log('クリックされました！');
    e.preventDefault();
    
    // カード情報生成
    const card = {
      number: document.getElementById('number').value,
      cvc: document.getElementById('cvc').value,
      exp_month: document.getElementById('exp_month').value,
      exp_year: document.getElementById('exp_year').value
    };
    
    // トークン生成
    Payjp.createToken(card, (status, response) => {
      if (status === 200) {
        // 出力（本来はサーバへ送信）
        document.getElementById('card_token').innerHTML = response.card.id;
      }
    });
  });
}, false);