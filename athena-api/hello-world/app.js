// const url = 'http://checkip.amazonaws.com/';

const aws = require('aws-sdk');
const AthenaExpress = require('athena-express')

exports.lambdaHandler = async (event, context) => {
    const athenaConfig = {
        aws,
        s3: 's3://vehicles-athena-express-db-queries'
    };
    const athenaExpress = new AthenaExpress(athenaConfig);

    const query = 'select * from vehicles_db.vehicle limit 10';

    try {
        const result = await athenaExpress.query(query);
        return {
            statusCode: 200,
            body: result
        }
    } catch (err) {
        console.log(err);
        return err;
    }
};
