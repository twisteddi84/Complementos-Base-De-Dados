function differentNumbers(){
    const phones = db.phones.find().toArray();
    let number_difference = 0;
    for (let i = 0; i < phones.length; i++) {
        const phone = phones[i]["display"];
        const phone_ok = phone.replace("+351-", "");
        const phone_split = phone_ok.split("");
        var not_equal = false;
        for (let j = 0; j < phone_split.length; j++) {
            for (let k = j+1; k < phone_split.length; k++) {
                if (phone_split[j] === phone_split[k]) {
                    not_equal = true;
                }
            }
        }
        if (!not_equal) {
            print(phone_ok);
            number_difference++;
        }
    }
    print("Number of phones with different numbers: ",number_difference);
}