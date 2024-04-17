const sqlite3 = require('sqlite3').verbose();

const db = new sqlite3.Database('path/to/your/database.db', sqlite3.OPEN_READWRITE, (err) => {
    if (err) {
        console.error(err.message);
    } else {
        console.log('Connected to the database.');
        // Jalankan query
        const query = `
            SELECT 
                t1.id,
                t1.name,
                t2.name AS parent_name
            FROM 
                data t1
            LEFT JOIN 
                data t2 ON t1.parent_id = t2.id;
        `;

        db.all(query, (err, rows) => {
            if (err) {
                console.error(err.message);
                return;
            }
            // Tampilkan hasil query
            console.log('id  name  parent_name');
            rows.forEach(row => {
                console.log(`${row.id}   ${row.name}   ${row.parent_name || 'NULL'}`);
            });
            db.close();
        });
    }
});
