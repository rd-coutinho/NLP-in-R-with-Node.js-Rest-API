var R = require("r-script");

function classifica(req, res) {
    // Open the request body and search for the names inside the object
    // Substituting: var new_review = req.body.new_review ...
    var review = { new_review } = req.body;
    // console.log(review)

    // Load the script with the review data
    var result = R("NLP_production.R").data(review);

    // Check if there was a response (if used in a route)
    if (res != null) {
        result.call(
            function(err, script_response) {
                // if (err) throw err;
                if (err) console.log(err);
                res.send({ Classification: script_response });
                res.end();
            })
    } else {
        return result;
    }
}

module.exports = { classifica }

// Check if the script is being executed directly or imported
// If the script is imported, do not execute the code below
if (require.main === module){

    // Request object containing a review data
    var requisicao = 
    { 
        body: {
            new_review: "That was really good!!!"
        }
    };

    classifica(requisicao)
        .call(function(erro, data) {
            if (erro) throw erro;
            console.log(data);
        });
}