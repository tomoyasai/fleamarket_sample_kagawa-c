$(function(){

  function buildForm(categories){
    let options='';
    categories.forEach(function (category) { 
      options += `
                  <option value="${category.id}">${category.name}</option>
                 `;
    });

    
    const html=`
      <select class="form-pull-down select-category"  name="item[category_id]">
        <option value="">---</option>
        ${options}
      </select>
    `
    return html
  }


//changeイベント設定箇所
  $('.base__main__detail__category').on('change','.form-pull-down',function(){
    $(this).nextAll().remove()  //選択された要素より下のformを一度リセット
    const category_id=$(this).val() //選択されたidを取得

  //Ajaxのリクエストを記述
    $.ajax({
      type: "GET",
      url: "/api/items/category",
      data: {category_id: category_id },
      dataType: 'json'
    })
    .done(function(categories) {
      if(categories.length==0){ //レスポンスでカテゴリーがない場合は処理を行わない
        return false
      }
      
      const select_form=buildForm(categories) //挿入するフィームを作成
      const target=$('.base__main__detail__category') //append先である既存の要素を定義
      target.append(select_form)
    
    })
  })
});