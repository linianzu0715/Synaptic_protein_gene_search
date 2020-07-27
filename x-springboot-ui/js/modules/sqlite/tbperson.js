

$(function () {
    $.ajax({
        type: "POST",
        url: baseURL + "person/tbperson/getPpi",
        contentType: "application/json",
        timeout:30000,
        data: JSON.stringify({}),
        success: function(r){
            console.log(r);
            if(r.code === 0){
                var i,
                    s;
                var geneIdList = r.ppi.geneIdList;
                var abList = r.ppi.abList;

                g = {
                    nodes: [],
                    edges: []
                };

                for (i = 0; i < geneIdList.length; i++) {
                    g.nodes.push({
                        id: 'n' + geneIdList[i],
                        label: 'Node ' + geneIdList[i],
                        x: Math.random(),
                        y: Math.random(),
                        size: Math.random(),
                        color: '#666'
                    });
                }

                for (i = 0; i < abList.length; i++) {
                    var source = 'n' + ((abList[i].a) | 0);
                    var target = 'n' + ((abList[i].b) | 0);

                    g.edges.push({
                        id: 'e' + i,
                        source: source,
                        target: target,
                        size: Math.random(),
                        color: '#ccc'
                    });
                }

                s = new sigma({
                    graph: g,
                    container: 'graph-container'
                });

                setTimeout(function() {
                    console.log(s.renderers[0].snapshot({format: 'png', background: 'white', filename: 'my-graph.png', labels: false}));
                }, 1000);

            }else{
                layer.alert("服务器内部错误")
            }
        }
        // error:function () {
        //     layer.alert("访问超时")
        // }
    });
    // alert(2)
// layer.alert("3333")
});