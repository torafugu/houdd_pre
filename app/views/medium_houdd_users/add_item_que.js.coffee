jQuery('.item_ques').html("<%= raw(escape_javascript(render 'mypage_item_que_list')) %>")
alert("製造予定アイテムを追加しました。")