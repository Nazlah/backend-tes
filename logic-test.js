function groupAnagrams(words) {
    const anagrams = {};

    for (const word of words) {
        const sortedWord = word.split('').sort().join('');
        if (anagrams[sortedWord]) {
            anagrams[sortedWord].push(word);
        } else {
            anagrams[sortedWord] = [word];
        }
    }

    const result = [];
    for (const key in anagrams) {
        result.push(anagrams[key]);
    }

    return result;
}

const words = ['cook', 'save', 'taste', 'aves', 'vase', 'state', 'map'];
const groupedAnagrams = groupAnagrams(words);
console.log(groupedAnagrams);
