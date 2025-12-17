const appEl = document.querySelector('#app');

appEl.innerHTML = '';

const el = document.createElement('div') as HTMLDivElement;
el.className = 'p-4 bg-[#123]' as Uno;
el.innerText = 'm-4';

appEl.appendChild(el);
