jQuery ->
        $('.data_table').dataTable
          sPaginationType: "full_numbers"
          bJQueryUI: true
          oLanguage:
            "sLengthMenu": "Показывать _MENU_ строк"
            "sZeroRecords": "Ничего не найдено"
            "sInfo": "Показаны с _START_ по _END_ из _TOTAL_"
            "sInfoEmpty": "0"
            "sInfoFiltered": "(filtered from _MAX_ total records)"
            "sSearch": "Поиск: _INPUT_"
            "oPaginate":
              "sFirst": "<<"
              "sLast": ">>"
              "sPrevious": "<"
              "sNext": ">"
